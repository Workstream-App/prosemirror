require_relative './node'

module ProsemirrorToHtml
  module Nodes
    class CodeBlock < Node
      def tags
        [
          {
            tag: 'pre'
          },
          {
            tag: 'code'
          }
        ]
      end
    end
  end
end
