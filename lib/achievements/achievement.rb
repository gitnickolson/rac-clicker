# frozen_string_literal: true

module Achievements
  class Achievement
    def initialize(click = nil)
      @name = 'Achievement name'
      @description = 'Achievement description'
      @multiplier = 0.00
      @click = click
    end

    attr_reader :name, :description, :multiplier, :click

    def requirement_met?
      'Undefined'
    end
  end
end
