# frozen_string_literal: true

module Components
  module Displays
    class TextDisplay
      def initialize(click)
        @click = click
      end

      def display_click_text(x_coordinate, y_coordinate)
        @text ||= Text.new(
          click.count,
          x: x_coordinate,
          y: y_coordinate,
          style: 'bold',
          size: 30,
          color: 'white',
          z: 10
        )
      end

      def update_click_text
        @text&.text = click.count
      end

      private

      attr_reader :click
    end
  end
end
