# frozen_string_literal: true

module Components
  class Click
    def initialize(count = 0)
      @count = count
      @multipliers = {}
    end

    attr_accessor :count, :multipliers

    def raise_count(amount = 1)
      self.count += multiplied_amount(amount)
    end

    private

    def multiplied_amount(amount)
      multipliers.each_value do |multiplier_number|
        next if multiplier_number.nil?

        amount *= (1 + multiplier_number)
      end
      amount
    end
  end
end
