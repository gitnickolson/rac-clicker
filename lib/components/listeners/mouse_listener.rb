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
            if raccoon_clicked?(event.x,
                                event.y,
                                [raccoon.x_coordinate, raccoon.y_coordinate],
                                [raccoon.image_width, raccoon.image_height],
                                [raccoon.margin_x, raccoon.margin_y])
              click.raise_count
              raccoon.new_image
            end
          end
        end
      end

      private

      def raccoon_clicked?(mouse_x, mouse_y, raccoon_coordinates, raccoon_size, margins)
        mouse_on_raccoon_x(mouse_x, raccoon_coordinates[0], margins[0], raccoon_size[0]) &&
          mouse_on_raccoon_y(mouse_y, raccoon_coordinates[1], margins[1], raccoon_size[1])
      end

      def mouse_on_raccoon_x(mouse_x, raccoon_coordinates_x, margin_x, raccoon_size_x)
        mouse_x > (raccoon_coordinates_x + margin_x) &&
          mouse_x <= ((raccoon_coordinates_x + raccoon_size_x) - margin_x)
      end

      def mouse_on_raccoon_y(mouse_y, raccoon_coordinates_y, margin_y, raccoon_size_y)
        mouse_y > (raccoon_coordinates_y + margin_y) &&
          mouse_y <= ((raccoon_coordinates_y + raccoon_size_y) - margin_y)
      end
    end
  end
end
