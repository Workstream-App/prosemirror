Dir[File.join(__dir__, 'marks', '*.rb')].sort.each { |file| require file }
Dir[File.join(__dir__, 'nodes', '*.rb')].sort.each { |file| require file }

require 'json'
require 'ostruct'

module Prosemirror
  module Text
    class Renderer
      def render(hash)
        object = JSON.parse(hash.to_json, object_class: OpenStruct)
        nodes = object.content.map { |node| render_node(node) }

        nodes.reject(&:empty?).join(' ')
      end

      private

      def render_node(item)
        node = get_matching_node(item)
        return '' if node.nil?

        text = render_all_prefixes(node)

        if node.content
          node.content.each do |content|
            text.push(render_node(content))
          end
        elsif node.text
          text.push(node.text)
        end

        text.push(render_all_suffixes(node))

        text.reject(&:empty?).join(' ')
      end

      def render_all_prefixes(node)
        text = []

        unless node.marks.nil?
          node.marks.each do |m|
            mark = get_matching_mark(m)
            next if mark.nil?

            text.push(mark.prefix) unless mark.prefix.nil?
          end
        end

        text.push(node.prefix) unless node.prefix.nil?

        text
      end

      def render_all_suffixes(node)
        text = []

        text.push(node.suffix) unless node.suffix.nil?

        return text if node.marks.nil?

        node.marks.reverse_each do |m|
          mark = get_matching_mark(m)
          next if mark.nil?

          text.push(mark.suffix) unless mark.suffix.nil?
        end

        text
      end

      # Find which Node matches the Text Node
      def get_matching_node(item)
        case item.type
        when 'hard_break'
          return Prosemirror::Text::Nodes::HardBreak.new(item)
        when 'image'
          return Prosemirror::Text::Nodes::Image.new(item)
        when 'bullet_list', 'ordered_list'
          return Prosemirror::Text::Nodes::List.new(item)
        when 'list_item'
          return Prosemirror::Text::Nodes::ListItem.new(item)
        when 'loom_embed'
          return Prosemirror::Text::Nodes::LoomEmbed.new(item)
        when 'mention'
          return Prosemirror::Text::Nodes::Mention.new(item)
        end

        Prosemirror::Text::Nodes::Node.new(item)
      end

      # Find which Mark matches the Text Element
      def get_matching_mark(item)
        return nil unless item.type == 'link'

        Prosemirror::Text::Marks::Link.new(item)
      end
    end
  end
end
