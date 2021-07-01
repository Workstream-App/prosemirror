require_relative './mark'

module Prosemirror
  module Html
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
end
