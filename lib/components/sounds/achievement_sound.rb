# frozen_string_literal: true

require 'components/sounds/sounds'

module Components
  module Sounds
    class AchievementSound < Sounds
      def initialize
        super
        @sound = Sound.new('./resources/sounds/achievement.mp3')
        @sound.volume = 35
      end
    end
  end
end
