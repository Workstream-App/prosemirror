require_relative './node'

module Prosemirror
  module Text
    module Nodes
      class ListItem < Node
        def prefix
          '-'
        end

        def suffix
          "\n"
        end
      end
    end
  end
end
