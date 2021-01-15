Dir[File.join(__dir__, 'marks', '*.rb')].sort.each { |file| require file }
Dir[File.join(__dir__, 'nodes', '*.rb')].sort.each { |file| require file }

require 'json'
require 'ostruct'

module ProsemirrorToHtml
  class Renderer
    MARKS = {
      'bold' => ProsemirrorToHtml::Marks::Bold,
      'code' => ProsemirrorToHtml::Marks::Code,
      'italic' => ProsemirrorToHtml::Marks::Italic,
      'link' => ProsemirrorToHtml::Marks::Link,
      'strike' => ProsemirrorToHtml::Marks::Strike
    }.freeze

    NODES = {
      'bullet_list' => ProsemirrorToHtml::Nodes::BulletList,
      'code_block' => ProsemirrorToHtml::Nodes::CodeBlock,
      'hard_break' => ProsemirrorToHtml::Nodes::HardBreak,
      'heading' => ProsemirrorToHtml::Nodes::Heading,
      'image' => ProsemirrorToHtml::Nodes::Image,
      'list_item' => ProsemirrorToHtml::Nodes::ListItem,
      'loom_embed' => ProsemirrorToHtml::Nodes::LoomEmbed,
      'mention' => ProsemirrorToHtml::Nodes::Mention,
      'ordered_list' => ProsemirrorToHtml::Nodes::OrderedList,
      'paragraph' => ProsemirrorToHtml::Nodes::Paragraph,
      'text' => ProsemirrorToHtml::Nodes::Text
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
