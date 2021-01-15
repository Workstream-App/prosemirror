require_relative './node'

module ProsemirrorToHtml
  module Nodes
    class BulletList < Node
      def tags
        [
          { tag: 'ul' }
        ]
      end
    end
  end
end
