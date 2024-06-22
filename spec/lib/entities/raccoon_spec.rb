# frozen_string_literal: true

require 'entities/raccoon'

RSpec.describe Entities::Raccoon do
  let(:image_width) { 200 }
  let(:image_height) { 100 }
  let(:x_coordinate) { 800 }
  let(:y_coordinate) { 600 }
  let(:raccoon) { described_class.new(x_coordinate:, y_coordinate:) }

  before do
    allow(FastImage).to receive(:size).with(Entities::Raccoon::RACCOON_IMAGE_FILEPATH).and_return([image_width,
                                                                                                   image_height])
  end

  describe '#margin_x' do
    it 'returns the correct margin for x' do
      expected_margin_x = image_width * 0.175
      expect(raccoon.margin_x).to eq(expected_margin_x)
    end
  end

  describe '#margin_y' do
    it 'returns the correct margin for y' do
      expected_margin_y = image_height * 0.175
      expect(raccoon.margin_y).to eq(expected_margin_y)
    end
  end
end
