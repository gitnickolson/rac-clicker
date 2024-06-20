# frozen_string_literal: true

$LOAD_PATH.unshift('./lib/')
require 'ruby2d'
require 'main'

Window.set(
  width: 1900,
  height: 1000,
  title: 'Rac clicker',
  background: '#8000ff'
)

Main.new.start
Window.show
