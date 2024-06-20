module Components
  module Listeners
    class Mouse
      def initialize(click, raccoon, click_text)
        @click = click
        @raccoon = raccoon
        @click_text = click_text
      end

      attr_reader :raccoon
      attr_accessor :click, :click_text

      def add_listener
        Window.on :mouse_down do |event|
          case event.button
          when :left
            click.raise_count if raccoon_clicked?(event.x, event.y, raccoon)
            click_text.text = click.count
          end
        end
      end

      private

      def raccoon_clicked?(mouse_x, mouse_y, raccoon)
        mouse_x > (raccoon.x_coordinate + 70) && mouse_x <= ((raccoon.x_coordinate + raccoon.image_width) - 70) &&
          mouse_y > (raccoon.y_coordinate + 70) && mouse_y <= ((raccoon.y_coordinate + raccoon.image_height) - 70)
      end
    end
  end
end