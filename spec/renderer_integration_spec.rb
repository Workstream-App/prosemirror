require_relative './spec_helper'

RSpec.describe ProsemirrorToHtml::Renderer do
  describe '#render' do
    context 'when there is a paragraph, text with marks, a hard break, and a bullet_list with list_items' do
      let(:expected_html) { '<p><strong><em><s>Text</s></em></strong></p><br></br><ul><li>Item 1</li><li>Item 2</li></ul>' }
      let(:json) do
        {
          type: 'doc',
          content: [
            {
              type: 'paragraph',
              content: [
                {
                  type: 'text',
                  text: 'Text',
                  marks: [
                    { type: 'bold' },
                    { type: 'italic' },
                    { type: 'strike' }
                  ]
                }
              ]
            },
            { type: 'hard_break' },
            {
              type: 'bullet_list',
              content: [
                {
                  type: 'list_item',
                  content: [{ type: 'text', text: 'Item 1' }]
                },
                {
                  type: 'list_item',
                  content: [{ type: 'text', text: 'Item 2' }]
                }
              ]
            }
          ]
        }
      end

      it 'renders correctly' do
        expect(subject.render(json)).to eq expected_html
      end
    end

    context 'when there is a paragraph with a mention and text' do
      let(:expected_html) { '<p><strong>John Doe</strong> what do you think?</p>' }
      let(:json) do
        {
          type: 'doc',
          content: [
            {
              type: 'paragraph',
              content: [
                {
                  type: 'mention',
                  attrs: {
                    label: 'John Doe'
                  }
                },
                {
                  type: 'text',
                  text: ' what do you think?'
                }
              ]
            }
          ]
        }
      end

      it 'renders correctly' do
        expect(subject.render(json)).to eq expected_html
      end
    end

    context 'when there is a loom_embed and paragraph with text' do
      let(:expected_html) { '<a href="https://www.loom.com/share/123"><img src="https://cdn.loom.com/sessions/thumbnails/123.gif" style="max-width: 470px;"></img></a><p>check this out</p>' }
      let(:json) do
        {
          type: 'doc',
          content: [
            {
              type: 'loom_embed',
              attrs: {
                src: 'https://www.loom.com/embed/123',
                share: 'https://www.loom.com/share/123',
                thumb: 'https://cdn.loom.com/sessions/thumbnails/123.gif'
              }
            },
            {
              type: 'paragraph',
              content: [
                {
                  type: 'text',
                  text: 'check this out'
                }
              ]
            }
          ]
        }
      end

      it 'renders correctly' do
        expect(subject.render(json)).to eq expected_html
      end
    end
  end
end
