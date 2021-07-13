require_relative './node'

module Prosemirror
  module Html
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
end
