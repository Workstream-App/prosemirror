require_relative './mark'

module ProsemirrorToHtml
  module Marks
    class Code < Mark
      def tags
        [
          { tag: 'code' }
        ]
      end
    end
  end
end
