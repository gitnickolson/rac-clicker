# frozen_string_literal: true

module Components
  module Listeners
    class MouseListener
      def initialize(click)
        @click = click
      end

      attr_reader :raccoon
      attr_accessor :click, :click_text

      def add_listener(raccoon)
        Window.on :mouse_down do |event|
          case event.button
          when :left
            click.raise_count if raccoon_clicked?(event.x, event.y, [raccoon.x_coordinate, raccoon.y_coordinate],
                                                  [raccoon.image_width, raccoon.image_height], [raccoon.margin_x, raccoon.margin_y])
          end
        end
      end

      private

      def raccoon_clicked?(mouse_x, mouse_y, raccoon_coordinates, raccoon_size, margins)
        mouse_x > (raccoon_coordinates[0] + margins[0]) && mouse_x <= ((raccoon_coordinates[0] + raccoon_size[0]) - margins[0]) &&
          mouse_y > (raccoon_coordinates[1] + margins[1]) && mouse_y <= ((raccoon_coordinates[1] + raccoon_size[1]) - margins[1])
      end
    end
  end
end
