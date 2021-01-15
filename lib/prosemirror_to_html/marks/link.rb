require_relative './mark'

module ProsemirrorToHtml
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
