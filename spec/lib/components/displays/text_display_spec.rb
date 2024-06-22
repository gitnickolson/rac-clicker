# frozen_string_literal: true

require 'components/displays/text_display'

RSpec.describe Components::Displays::TextDisplay do
  let(:click) { double('Click', count: 5) }
  let(:text_display) { described_class.new(click) }
  let(:text) { double('Text') }

  before do
    allow(Text).to receive(:new).and_return(text)
    allow(text).to receive(:text=)
  end

  describe '#display_click_text' do
    it 'creates a new Text object with the click count' do
      text_display.display_click_text(100, 200)
      expect(Text).to have_received(:new).with(
        click.count,
        x: 100,
        y: 200,
        style: 'bold',
        size: 30,
        color: 'white',
        z: 10
      )
    end
  end

  describe '#update_click_text' do
    context 'when @text is nil' do
      it 'does not update the text' do
        text_display.update_click_text
        expect(text).not_to have_received(:text=)
      end
    end

    context 'when @text is set' do
      before do
        text_display.display_click_text(100, 200)
      end

      it 'updates the text with the current click count' do
        text_display.update_click_text
        expect(text).to have_received(:text=).with(click.count)
      end
    end
  end
end
