# frozen_string_literal: true

require 'fastimage'

class Raccoon
  RACCOON_IMAGE_FILEPATH = 'resources/pope.png'

  def initialize(x_coordinate:, y_coordinate:)
    image_size = FastImage.size(RACCOON_IMAGE_FILEPATH)
    @image_width = image_size[0]
    @image_height = image_size[1]
    @x_coordinate = centered_x_for_image(x_coordinate)
    @y_coordinate = centered_y_for_image(y_coordinate)
    spawn
  end

  attr_reader :x_coordinate, :y_coordinate, :image_width, :image_height

  private

  def spawn
    Image.new(
      RACCOON_IMAGE_FILEPATH,
      x: x_coordinate,
      y: y_coordinate,
      width:,
      height:
    )
  end

  def centered_x_for_image(x_coordinate)
    (x_coordinate / 2) - (image_width / 2)
  end

  def centered_y_for_image(y_coordinate)
    (y_coordinate / 2) - (image_height / 2)
  end
end
