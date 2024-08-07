# frozen_string_literal: true

require 'components/sounds/sounds'

module Components
  module Sounds
    class ClickSound < Sounds
      def initialize
        super
        @sound = Sound.new('./resources/sounds/click.mp3')
        @sound.volume = 25
      end
    end
  end
end
