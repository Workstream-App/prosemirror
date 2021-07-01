require_relative './node'

module Prosemirror
  module Html
    module Nodes
      class Heading < Node
        def tags
          [
            { tag: "h#{data.attrs.level}" }
          ]
        end
      end
    end
  end
end
