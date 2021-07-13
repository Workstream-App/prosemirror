require_relative './node'

module Prosemirror
  module Html
    module Nodes
      class Image < Node
        def tags
          [
            { tag: 'img', attrs: data.attrs }
          ]
        end
      end
    end
  end
end
