# frozen_string_literal: true

module Components
  module Listeners
    class MouseListener
      def initialize(click, raccoon)
        @click = click
        @raccoon = raccoon
      end

      attr_reader :raccoon
      attr_accessor :click, :click_text

      def add_listener
        Window.on :mouse_down do |event|
          case event.button
          when :left
            if raccoon_clicked?(event.x, event.y)
              raccoon_clicked_event
            end
          end
        end

        Window.on :mouse_up do |event|
          case event.button
          when :left
            if @raccoon_was_clicked
              raccoon_unclick_event
            end
          end
        end
      end

      private

      def raccoon_clicked?(mouse_x, mouse_y)
        mouse_on_raccoon_x(mouse_x) && mouse_on_raccoon_y(mouse_y)
      end

      def raccoon_clicked_event
        click.raise_count
        raccoon.rescale_for_removal
        @raccoon_was_clicked = true
      end

      def raccoon_unclick_event
        raccoon.new_image
        @raccoon_was_clicked = false
      end

      def mouse_on_raccoon_x(mouse_x)
        mouse_x > (raccoon.x_coordinate + raccoon.margin_x) &&
          mouse_x <= ((raccoon.x_coordinate + raccoon.image_width) - raccoon.margin_x)
      end

      def mouse_on_raccoon_y(mouse_y)
        mouse_y > (raccoon.y_coordinate + raccoon.margin_y) &&
          mouse_y <= ((raccoon.y_coordinate + raccoon.image_height) - raccoon.margin_y)
      end
    end
  end
end
