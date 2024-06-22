# frozen_string_literal: true

require 'components/listeners/mouse_listener'
require 'entities/raccoon'

RSpec.describe Components::Listeners::MouseListener do
  let(:click) { double('Click', raise_count: nil) }
  let(:raccoon) do
    double('Raccoon', x_coordinate: 100, y_coordinate: 100, image_width: 200, image_height: 100, margin_x: 20,
                      margin_y: 10)
  end
  let(:mouse_listener) { described_class.new(click) }
  let(:window_mock) { double('Window') }

  before do
    allow(Window).to receive(:on)
  end

  describe '#add_listener' do
    it 'adds a mouse down listener to the window' do
      mouse_listener.add_listener(raccoon)

      expect(Window).to have_received(:on).with(:mouse_down)
    end

    it 'raises the click count if the raccoon is clicked' do
      mouse_listener.add_listener(raccoon)

      event = double('Event', button: :left, x: 150, y: 150)
      allow(Window).to receive(:on).with(:mouse_down).and_yield(event)

      expect(click).to receive(:raise_count)
      mouse_listener.add_listener(raccoon)
    end

    it 'does not raise the click count if the raccoon is not clicked' do
      mouse_listener.add_listener(raccoon)

      event = double('Event', button: :left, x: 50, y: 50)
      allow(Window).to receive(:on).with(:mouse_down).and_yield(event)

      expect(click).not_to receive(:raise_count)
      mouse_listener.add_listener(raccoon)
    end

    it 'does not raise the click count if raccoon is clicked with wrong button' do
      mouse_listener.add_listener(raccoon)

      event = double('Event', button: :right, x: 150, y: 150)
      allow(Window).to receive(:on).with(:mouse_down).and_yield(event)

      expect(click).not_to receive(:raise_count)
      mouse_listener.add_listener(raccoon)
    end
  end

  describe '#raccoon_clicked?' do
    it 'returns true if the mouse click is within the raccoon bounds' do
      expect(mouse_listener.send(:raccoon_clicked?, 150, 150, [100, 100], [200, 100], [20, 10])).to be true
    end

    it 'returns false if the mouse click is outside the raccoon bounds' do
      expect(mouse_listener.send(:raccoon_clicked?, 50, 50, [100, 100], [200, 100], [20, 10])).to be false
    end
  end
end
