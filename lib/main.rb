# frozen_string_literal: true

require 'raccoon'
require 'click'

class Main
  def initialize
    @click = Click.new
    @raccoon = Raccoon.new(x_coordinate: Window.width, y_coordinate: Window.height)
    @click_text = display_click_text(click, raccoon)
  end

  def start
    add_mouse_listener
  end

  private

  attr_accessor :click, :click_text
  attr_reader :raccoon

  def start_loop
    Thread.new do
      tick = 0

      Window.update do
        tick += 1
      end
    end
  end

  def add_mouse_listener
    Window.on :mouse_down do |event|
      case event.button
      when :left
        click.raise_count if raccoon_clicked?(event.x, event.y, raccoon)
        click_text.text = click.count
      end
    end
  end

  def raccoon_clicked?(mouse_x, mouse_y, raccoon)
    mouse_x > (raccoon.x_coordinate + 70) && mouse_x <= ((raccoon.x_coordinate + raccoon.image_width) - 70) &&
      mouse_y > (raccoon.y_coordinate + 70) && mouse_y <= ((raccoon.y_coordinate + raccoon.image_height) - 70)
  end

  def display_click_text(click, raccoon)
    Text.new(
      click.count,
      x: raccoon.x_coordinate + 30,
      y: raccoon.y_coordinate - 10,
      style: 'bold',
      size: 30,
      color: 'white',
      z: 10
    )
  end
end
