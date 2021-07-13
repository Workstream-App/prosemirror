require_relative './../spec_helper'

RSpec.describe Prosemirror::Text::Renderer do
  subject { described_class.new }

  describe '#render' do
    context 'when there is a bullet_list node' do
      let(:expected_text) { "\n \n" }
      let(:json) do
        {
          type: 'doc',
          content: [
            {
              type: 'bullet_list'
            }
          ]
        }
      end

      it 'renders correctly' do
        expect(subject.render(json)).to eq expected_text
      end
    end

    context 'when there is a code_block node' do
      let(:expected_text) { '' }
      let(:json) do
        {
          type: 'doc',
          content: [
            {
              type: 'code_block'
            }
          ]
        }
      end

      it 'renders correctly' do
        expect(subject.render(json)).to eq expected_text
      end
    end

    context 'when there is a hard_break node' do
      let(:expected_text) { "\n" }
      let(:json) do
        {
          type: 'doc',
          content: [
            {
              type: 'hard_break'
            }
          ]
        }
      end

      it 'renders correctly' do
        expect(subject.render(json)).to eq expected_text
      end
    end

    context 'when there is a heading node' do
      let(:expected_text) { '' }
      let(:json) do
        {
          type: 'doc',
          content: [
            {
              type: 'heading',
              attrs: {
                level: 1
              }
            }
          ]
        }
      end

      it 'renders correctly' do
        expect(subject.render(json)).to eq expected_text
      end
    end

    context 'when there is an image node' do
      let(:expected_text) { 'http://www.test.com/text.jpg' }
      let(:json) do
        {
          type: 'doc',
          content: [
            {
              type: 'image',
              attrs: {
                src: 'http://www.test.com/text.jpg'
              }
            }
          ]
        }
      end

      it 'renders correctly' do
        expect(subject.render(json)).to eq expected_text
      end
    end

    context 'when there is a list_item node' do
      let(:expected_text) { "- Item \n" }
      let(:json) do
        {
          type: 'doc',
          content: [
            {
              type: 'list_item',
              content: [
                {
                  type: 'text',
                  text: 'Item'
                }
              ]
            }
          ]
        }
      end

      it 'renders correctly' do
        expect(subject.render(json)).to eq expected_text
      end
    end

    context 'when there is a loom_embed node' do
      let(:expected_text) { 'https://www.loom.com/share/123' }
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
            }
          ]
        }
      end

      it 'renders correctly' do
        expect(subject.render(json)).to eq expected_text
      end
    end

    context 'when there is a mention node' do
      let(:expected_text) { 'John Doe' }
      let(:json) do
        {
          type: 'doc',
          content: [
            {
              type: 'mention',
              attrs: {
                id: 123,
                label: 'John Doe'
              }
            }
          ]
        }
      end

      it 'renders correctly' do
        expect(subject.render(json)).to eq expected_text
      end
    end

    context 'when there is a ordered_list node' do
      let(:expected_text) { "\n \n" }
      let(:json) do
        {
          type: 'doc',
          content: [
            {
              type: 'ordered_list'
            }
          ]
        }
      end

      it 'renders correctly' do
        expect(subject.render(json)).to eq expected_text
      end
    end

    context 'when there is a paragraph node' do
      let(:expected_text) { '' }
      let(:json) do
        {
          type: 'doc',
          content: [
            {
              type: 'paragraph'
            }
          ]
        }
      end

      it 'renders correctly' do
        expect(subject.render(json)).to eq expected_text
      end
    end

    context 'when there is a text node' do
      context 'and there are no marks' do
        let(:expected_text) { 'text' }
        let(:json) do
          {
            type: 'doc',
            content: [
              {
                type: 'text',
                text: 'text'
              }
            ]
          }
        end

        it 'renders correctly' do
          expect(subject.render(json)).to eq expected_text
        end
      end

      context 'and there is a bold mark' do
        let(:expected_text) { 'text' }
        let(:json) do
          {
            type: 'doc',
            content: [
              {
                type: 'text',
                text: 'text',
                marks: [
                  {
                    type: 'bold'
                  }
                ]
              }
            ]
          }
        end

        it 'renders correctly' do
          expect(subject.render(json)).to eq expected_text
        end
      end

      context 'and there is a code mark' do
        let(:expected_text) { 'text' }
        let(:json) do
          {
            type: 'doc',
            content: [
              {
                type: 'text',
                text: 'text',
                marks: [
                  {
                    type: 'code'
                  }
                ]
              }
            ]
          }
        end

        it 'renders correctly' do
          expect(subject.render(json)).to eq expected_text
        end
      end

      context 'and there is a italic mark' do
        let(:expected_text) { 'text' }
        let(:json) do
          {
            type: 'doc',
            content: [
              {
                type: 'text',
                text: 'text',
                marks: [
                  {
                    type: 'italic'
                  }
                ]
              }
            ]
          }
        end

        it 'renders correctly' do
          expect(subject.render(json)).to eq expected_text
        end
      end

      context 'and there is a strike mark' do
        let(:expected_text) { 'text' }
        let(:json) do
          {
            type: 'doc',
            content: [
              {
                type: 'text',
                text: 'text',
                marks: [
                  {
                    type: 'strike'
                  }
                ]
              }
            ]
          }
        end

        it 'renders correctly' do
          expect(subject.render(json)).to eq expected_text
        end
      end

      context 'and there is a link' do
        let(:expected_text) { 'text (https://www.test.com)' }
        let(:json) do
          {
            type: 'doc',
            content: [
              {
                type: 'text',
                text: 'text',
                marks: [
                  {
                    type: 'link',
                    attrs: {
                      href: 'https://www.test.com',
                      target: '_blank'
                    }
                  }
                ]
              }
            ]
          }
        end

        it 'renders correctly' do
          expect(subject.render(json)).to eq expected_text
        end
      end
    end

    context 'when there is an unknown node' do
      let(:json) do
        {
          type: 'doc',
          content: [
            {
              type: 'unknown'
            }
          ]
        }
      end

      it 'renders an empty string' do
        expect(subject.render(json)).to eq ''
      end
    end
  end
end
