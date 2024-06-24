# frozen_string_literal: true

require 'entities/raccoon'
require 'components/click'
require 'components/displays/text_display'
require 'components/listeners/mouse_listener'

class Game
  def initialize
    @click = Components::Click.new
    @raccoon = Entities::Raccoon.new
    @mouse_listener = Components::Listeners::MouseListener.new(click, raccoon)
    @text_display = Components::Displays::TextDisplay.new(click)
  end

  def run
    add_mouse_listener
    add_text_display
    start_refresh_loop
  end

  private

  attr_accessor :click, :text_display, :mouse_listener
  attr_reader :raccoon

  def start_refresh_loop
    tick = 0

    Window.update do
      if (tick % 1).zero?
        tick = 0
        text_display.update_click_text
      end
      tick += 1
    end
  end

  def add_mouse_listener
    mouse_listener.add_listener
  end

  def add_text_display
    text_display.display_click_text(Window.width / 8, Window.height / 10)
  end
end
