module Prosemirror
  module Html
    module Marks
      class Mark
        attr_reader :node

        def initialize(node)
          @node = node
        end
      end
    end
  end
end
