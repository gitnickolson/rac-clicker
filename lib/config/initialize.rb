# frozen_string_literal: true

$LOAD_PATH.unshift('./lib/')
require 'config/config'
require 'main'

create_window(
  width: 1900,
  height: 1000,
  title: 'Rac clicker',
  background: '#8000ff'
)

Main.new.start
show_window
