# frozen_string_literal: true

module Components
  class Click
    def initialize(count = 0)
      @count = count
    end

    attr_accessor :count

    def raise_count(amount = 1)
      self.count += amount
    end
  end
end
