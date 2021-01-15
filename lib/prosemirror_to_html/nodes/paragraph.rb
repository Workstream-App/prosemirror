require_relative './node'

module ProsemirrorToHtml
  module Nodes
    class Paragraph < Node
      def tags
        [
          { tag: 'p' }
        ]
      end
    end
  end
end
