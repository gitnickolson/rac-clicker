# frozen_string_literal: true

class Click
  def initialize(count = 0)
    @count = count
  end

  attr_accessor :count

  def raise_count(amount = 1)
    self.count += amount
  end
end
