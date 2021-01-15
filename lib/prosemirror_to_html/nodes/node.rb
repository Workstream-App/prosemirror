module ProsemirrorToHtml
  module Nodes
    class Node
      attr_reader :data

      def initialize(data)
        @data = data
      end

      def content
        data.content
      end

      def marks
        data.marks
      end

      def tags
        nil
      end

      def text
        data.text
      end
    end
  end
end
