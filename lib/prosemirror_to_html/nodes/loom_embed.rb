require_relative './node'

module ProsemirrorToHtml
  module Nodes
    class LoomEmbed < Node
      def tags
        [
          {
            tag: 'a',
            attrs: {
              href: data.attrs[:share]
            }
          },
          {
            tag: 'img',
            attrs: {
              src: data.attrs[:thumb],
              style: 'max-width: 300px;'
            }
          }
        ]
      end
    end
  end
end
