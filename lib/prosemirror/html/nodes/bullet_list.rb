require_relative './node'

module Prosemirror
  module Html
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
end
