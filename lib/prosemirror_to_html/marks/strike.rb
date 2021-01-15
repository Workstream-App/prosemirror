require_relative './mark'

module ProsemirrorToHtml
  module Marks
    class Strike < Mark
      def tags
        [
          { tag: 's' }
        ]
      end
    end
  end
end
