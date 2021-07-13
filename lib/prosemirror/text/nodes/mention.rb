require_relative './node'

module Prosemirror
  module Text
    module Nodes
      class Mention < Node
        def text
          data.attrs[:label]
        end
      end
    end
  end
end
