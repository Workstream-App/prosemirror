require_relative './mark'

module Prosemirror
  module Html
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
end
