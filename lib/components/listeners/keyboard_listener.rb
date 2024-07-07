# frozen_string_literal: true

module Components
  module Listeners
    class KeyboardListener
      def initialize(click, raccoon)
        @click = click
        @raccoon = raccoon
      end

      attr_reader :raccoon
      attr_accessor :click

      def add_listener
        listen_to_key_down
        listen_to_key_up
      end

      private

      def listen_to_key_down
        Window.on :key_down do |event|
          case event.key
          when 'space'
            raccoon_clicked_event
          when 'return'
            raccoon_clicked_event
          end
        end
      end

      def listen_to_key_up
        Window.on :key_up do |event|
          case event.key
          when 'space'
            raccoon_unclick_event if @raccoon_was_clicked
          when 'return'
            raccoon_unclick_event if @raccoon_was_clicked
          end
        end
      end

      def raccoon_clicked_event
        click.raise_count
        Components::Sounds::ClickSound.new.play
        raccoon.rescale_for_removal
        @raccoon_was_clicked = true
      end

      def raccoon_unclick_event
        raccoon.new_image
        @raccoon_was_clicked = false
      end
    end
  end
end
