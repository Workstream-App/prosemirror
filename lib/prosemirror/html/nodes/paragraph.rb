require_relative './node'

module Prosemirror
  module Html
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
end
