Dir[File.join(__dir__, 'marks', '*.rb')].sort.each { |file| require file }
Dir[File.join(__dir__, 'nodes', '*.rb')].sort.each { |file| require file }

require 'json'
require 'ostruct'

module Prosemirror
  module Html
    class Renderer
      MARKS = {
        'bold' => Prosemirror::Html::Marks::Bold,
        'code' => Prosemirror::Html::Marks::Code,
        'italic' => Prosemirror::Html::Marks::Italic,
        'link' => Prosemirror::Html::Marks::Link,
        'strike' => Prosemirror::Html::Marks::Strike
      }.freeze

      NODES = {
        'bullet_list' => Prosemirror::Html::Nodes::BulletList,
        'code_block' => Prosemirror::Html::Nodes::CodeBlock,
        'hard_break' => Prosemirror::Html::Nodes::HardBreak,
        'heading' => Prosemirror::Html::Nodes::Heading,
        'image' => Prosemirror::Html::Nodes::Image,
        'list_item' => Prosemirror::Html::Nodes::ListItem,
        'loom_embed' => Prosemirror::Html::Nodes::LoomEmbed,
        'mention' => Prosemirror::Html::Nodes::Mention,
        'ordered_list' => Prosemirror::Html::Nodes::OrderedList,
        'paragraph' => Prosemirror::Html::Nodes::Paragraph,
        'text' => Prosemirror::Html::Nodes::Text
      }.freeze

      def render(hash)
        object = JSON.parse(hash.to_json, object_class: OpenStruct)
        nodes = object.content.map { |node| render_node(node) }

        nodes.join
      end

      private

      def render_node(item)
        node = get_matching_node(item)
        return '' if node.nil?

        html = render_all_opening_tags(node)

        if node.content
          node.content.each do |content|
            html.push(render_node(content))
          end
        elsif node.text
          html.push(node.text)
        end

        html.push(render_all_closing_tags(node))

        html.join
      end

      def render_all_opening_tags(node)
        html = []

        unless node.marks.nil?
          node.marks.each do |m|
            mark = get_matching_mark(m)
            next if mark.nil?

            html.push(render_opening_tags(mark.tags)) unless mark.tags.nil?
          end
        end

        html.push(render_opening_tags(node.tags)) unless node.tags.nil?

        html
      end

      def render_opening_tags(tags)
        tags.map do |tag|
          h = "<#{tag[:tag]}"
          tag[:attrs].each_pair { |key, value| h += " #{key}=\"#{value}\"" } if tag[:attrs]
          "#{h}>"
        end.join
      end

      def render_all_closing_tags(node)
        html = []

        html.push(render_closing_tags(node.tags)) unless node.tags.nil?

        return html if node.marks.nil?

        node.marks.reverse_each do |m|
          mark = get_matching_mark(m)
          next if mark.nil?

          html.push(render_closing_tags(mark.tags)) unless mark.tags.nil?
        end

        html
      end

      def render_closing_tags(tags)
        tags.reverse.map { |tag| "</#{tag[:tag]}>" }.join
      end

      # Find which Node matches the Html Node
      def get_matching_node(item)
        node = NODES[item.type]
        node.new(item) unless node.nil?
      end

      # Find which Mark matches the HtmlElement
      def get_matching_mark(item)
        mark = MARKS[item.type]
        mark.new(item) unless mark.nil?
      end
    end
  end
end
