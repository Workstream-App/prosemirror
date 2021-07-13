require_relative './node'

module Prosemirror
  module Text
    module Nodes
      class Image < Node
        def text
          data.attrs[:src]
        end
      end
    end
  end
end
