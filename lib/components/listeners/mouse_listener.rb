# frozen_string_literal: true

module Components
  module Listeners
    class Mouse
      def initialize(click)
        @click = click
      end

      attr_reader :raccoon
      attr_accessor :click, :click_text

      def add_listener(raccoon_x, raccoon_y, raccoon_width, racoon_height)
        Window.on :mouse_down do |event|
          case event.button
          when :left
            click.raise_count if raccoon_clicked?(event.x, event.y, [raccoon_x, raccoon_y],
                                                  [raccoon_width, racoon_height])
          end
        end
      end

      private

      def raccoon_clicked?(mouse_x, mouse_y, raccoon_coordinates, raccoon_size)
        mouse_x > (raccoon_coordinates[0] + 70) && mouse_x <= ((raccoon_coordinates[0] + raccoon_size[0]) - 70) &&
          mouse_y > (raccoon_coordinates[1] + 70) && mouse_y <= ((raccoon_coordinates[1] + raccoon_size[1]) - 70)
      end
    end
  end
end
