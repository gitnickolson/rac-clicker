# frozen_string_literal: true

require 'game'
require 'components/click'
require 'components/displays/text_display'

RSpec.describe Game do
  let(:click) { Components::Click.new }
  let(:text_display) { Components::Displays::TextDisplay.new(click) }

  before do
    allow(Components::Click).to receive(:new).and_return(click)
    allow(Components::Displays::TextDisplay).to receive(:new).and_return(text_display)
  end

  describe '#run' do
    it 'initializes Click' do
      Game.new.run
      expect(Components::Click).to have_received(:new)
    end

    it 'initializes TextDisplay' do
      Game.new.run
      expect(Components::Displays::TextDisplay).to have_received(:new).with(click)
    end
  end
end
