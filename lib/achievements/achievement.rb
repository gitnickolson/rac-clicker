# frozen_string_literal: true

module Achievements
  class Achievement
    def initialize
      @name = 'Achievement name'
      @description = 'Achievement description'
      @multiplier = 0.00
    end

    attr_reader :name, :description, :multiplier
  end
end
