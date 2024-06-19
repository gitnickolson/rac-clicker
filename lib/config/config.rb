# frozen_string_literal: true

require 'ruby2d'

def create_window(width:, height:, title:, background:)
  Window.set(
    width:,
    height:,
    title:,
    background:
  )
end

def show_window
  Window.show
end
