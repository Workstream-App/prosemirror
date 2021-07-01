require_relative './node'

module Prosemirror
  module Html
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
end
