# frozen_string_literal: true

require 'components/sounds/sounds'

module Components
  module Sounds
    class Sounds
      attr_reader :sound

      def play
        sound.play
      end
    end
  end
end
