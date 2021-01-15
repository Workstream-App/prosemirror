require_relative './mark'

module ProsemirrorToHtml
  module Marks
    class Italic < Mark
      def tags
        [
          { tag: 'em' }
        ]
      end
    end
  end
end
