require_relative './node'

module ProsemirrorToHtml
  module Nodes
    class ListItem < Node
      def tags
        [
          { tag: 'li' }
        ]
      end
    end
  end
end
