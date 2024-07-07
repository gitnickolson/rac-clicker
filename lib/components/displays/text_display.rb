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
        @text&.text = click.count.round(2)
      end

      def show_achievement_text(achievement)
        text = Text.new(
          "Achievement reached: #{achievement.name}",
          x: 5,
          y: Window.height - 30,
          color: 'white'
        )

        Thread.new do
          sleep 5
          remove_achievement_text(text)
        end
      end

      private

      def remove_achievement_text(text)
        text.remove
      end

      attr_reader :click
    end
  end
end
