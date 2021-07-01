require_relative './node'

module Prosemirror
  module Html
    module Nodes
      class CodeBlock < Node
        def tags
          [
            {
              tag: 'pre'
            },
            {
              tag: 'code'
            }
          ]
        end
      end
    end
  end
end
