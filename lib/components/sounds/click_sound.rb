# frozen_string_literal: true

module Components
  module Sounds
    class ClickSound
      def initialize
        @sound = Sound.new('./resources/sounds/click.mp3')
        sound.volume = 25
      end

      attr_reader :sound

      def play
        sound.play
      end
    end
  end
end
