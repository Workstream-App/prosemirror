require_relative './node'

module Prosemirror
  module Text
    module Nodes
      class List < Node
        def prefix
          "\n"
        end

        def suffix
          "\n"
        end
      end
    end
  end
end
