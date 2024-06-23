# frozen_string_literal: true

require 'fastimage'

module Entities
  class Raccoon
    FILEPATH = './resources/raccoons/'

    def initialize
      new_image
    end

    attr_reader :x_coordinate, :y_coordinate, :image_width, :image_height

    def new_image
      remove_previous_image unless image_object.nil?
      @image = random_raccoon_image
      set_values_for_image
      spawn
    end

    def rescale_for_removal
      @image_width -= 100
      @image_height -= 100
      image_object.x = centered_x_for_image
      image_object.y = centered_y_for_image
      image_object.width = image_width
      image_object.height = image_height
    end

    def margin_x
      image_width * 0.175
    end

    def margin_y
      image_height * 0.175
    end

    private

    attr_reader :image, :image_object

    def spawn
      @image_object = Image.new(
        image,
        x: x_coordinate,
        y: y_coordinate,
        width:,
        height:
      )
    end

    def remove_previous_image
      image_object.remove
    end

    def set_values_for_image
      image_size = FastImage.size(image)
      @image_width = image_size[0]
      @image_height = image_size[1]
      @x_coordinate = centered_x_for_image
      @y_coordinate = centered_y_for_image
    end

    def centered_x_for_image
      (Window.width / 2) - (image_width / 2)
    end

    def centered_y_for_image
      (Window.height / 2) - (image_height / 2)
    end

    def random_raccoon_image
      "#{FILEPATH}#{raccoon_image_files.sample}"
    end

    def raccoon_image_files
      Dir.entries(FILEPATH).reject do |path_name|
        ['.', '..'].include?(path_name)
      end
    end
  end
end
