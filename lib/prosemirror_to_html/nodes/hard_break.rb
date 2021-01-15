require_relative './node'

module ProsemirrorToHtml
  module Nodes
    class HardBreak < Node
      def tags
        [
          { tag: 'br' }
        ]
      end
    end
  end
end
