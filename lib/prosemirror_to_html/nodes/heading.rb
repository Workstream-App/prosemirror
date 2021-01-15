require_relative './node'

module ProsemirrorToHtml
  module Nodes
    class Heading < Node
      def tags
        [
          { tag: "h#{data.attrs.level}" }
        ]
      end
    end
  end
end
