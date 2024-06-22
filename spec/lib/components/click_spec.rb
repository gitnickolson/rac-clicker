# frozen_string_literal: true

require 'components/click'

RSpec.describe Components::Click do
  describe '#raise_count' do
    let(:click) { described_class.new }

    context 'when no amount is specified' do
      it 'increments the count by 1' do
        click.raise_count
        expect(click.count).to eq(1)
      end
    end

    context 'when an amount is specified' do
      it 'increments the count by the specified amount' do
        click.raise_count(5)
        expect(click.count).to eq(5)
      end
    end
  end
end
