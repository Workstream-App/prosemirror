require_relative './node'

module Prosemirror
  module Html
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
end
