# frozen_string_literal: true

$LOAD_PATH.unshift('./lib/')
require 'ruby2d'
require 'game'

Window.set(
  width: 1100,
  height: 900,
  title: 'Click the raccoon!',
  background: '#8000ff'
)

Game.new.run
Window.show
