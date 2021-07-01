require_relative './mark'

module Prosemirror
  module Html
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
end
