require_relative './mark'

module ProsemirrorToHtml
  module Marks
    class Bold < Mark
      def tags
        [
          { tag: 'strong' }
        ]
      end
    end
  end
end
