require_relative './node'

module Prosemirror
  module Text
    module Nodes
      class HardBreak < Node
        def prefix
          "\n"
        end
      end
    end
  end
end
