# frozen_string_literal: true

$LOAD_PATH.unshift('./lib/')
require 'ruby2d'
require 'game'

Ruby2D::Font.default = '/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf'

Window.set(
  width: 1000,
  height: 1000,
  title: 'Rac clicker',
  background: '#8000ff'
)

Game.new.run
Window.show
