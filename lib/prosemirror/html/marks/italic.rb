require_relative './mark'

module Prosemirror
  module Html
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
end
