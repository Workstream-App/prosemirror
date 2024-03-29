require_relative './node'

module Prosemirror
  module Html
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
                style: 'max-width: 470px;'
              }
            }
          ]
        end
      end
    end
  end
end
