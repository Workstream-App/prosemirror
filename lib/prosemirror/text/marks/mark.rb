module Prosemirror
  module Text
    module Marks
      class Mark
        attr_reader :node

        def initialize(node)
          @node = node
        end

        def prefix
          nil
        end

        def suffix
          nil
        end
      end
    end
  end
end
