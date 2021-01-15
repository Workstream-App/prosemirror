require_relative './node'

module ProsemirrorToHtml
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
