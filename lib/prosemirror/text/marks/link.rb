require_relative './mark'

module Prosemirror
  module Text
    module Marks
      class Link < Mark
        def suffix
          "(#{@node['attrs']['href']})"
        end
      end
    end
  end
end
