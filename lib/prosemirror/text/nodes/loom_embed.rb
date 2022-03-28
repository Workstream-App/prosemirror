require_relative './node'

module Prosemirror
  module Text
    module Nodes
      class LoomEmbed < Node
        def text
          data['attrs']['share']
        end
      end
    end
  end
end
