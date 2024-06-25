# frozen_string_literal: true

require 'achievements/achievement'

module Achievements
  class OneThousand < Achievement
    def initialize
      super
      @name = 'One thousand'
      @description = 'Click the raccoon one thousand times.'
      @multiplier = 0.15
    end
  end
end
