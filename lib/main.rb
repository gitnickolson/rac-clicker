# frozen_string_literal: true

require 'entities/raccoon'
require 'components/click'
require 'components/listeners/mouse'

class Main
  def initialize
    @click = Components::Click.new
    @raccoon = Entities::Raccoon.new(x_coordinate: Window.width, y_coordinate: Window.height)
    @click_text = display_click_text(click, raccoon)
    @mouse_listener = Components::Listeners::Mouse.new(click, raccoon, click_text)
  end

  def start
    mouse_listener.add_listener
  end

  private

  attr_accessor :click, :click_text, :mouse_listener
  attr_reader :raccoon

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
