require_relative './mark'

module Prosemirror
  module Html
    module Marks
      class Link < Mark
        def tags
          [
            { tag: 'a', attrs: @node.attrs }
          ]
        end
      end
    end
  end
end
