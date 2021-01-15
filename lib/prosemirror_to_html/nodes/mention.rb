require_relative './node'

module ProsemirrorToHtml
  module Nodes
    class Mention < Node
      def tags
        [
          { tag: 'strong' }
        ]
      end

      def text
        data.attrs.label
      end
    end
  end
end
