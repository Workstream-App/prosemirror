require_relative './node'

module ProsemirrorToHtml
  module Nodes
    class OrderedList < Node
      def tags
        [
          { tag: 'ol' }
        ]
      end
    end
  end
end
