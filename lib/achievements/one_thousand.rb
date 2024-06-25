# frozen_string_literal: true

require 'achievements/achievement'
require 'components/click'

module Achievements
  class OneThousand < Achievement
    def initialize(click)
      super
      @name = 'One thousand'
      @description = 'Click the raccoon one thousand times.'
      @multiplier = 0.15
    end

    def requirement_met?
      click.count >= 1000
    end
  end
end
