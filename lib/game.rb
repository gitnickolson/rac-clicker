# frozen_string_literal: true

require 'entities/raccoon'
require 'components/click'
require 'components/displays/text_display'
require 'components/listeners/mouse_listener'
require 'components/listeners/keyboard_listener'
require 'components/sounds/achievement_sound'
require 'achievements/one_thousand'

class Game
  def initialize
    @click = Components::Click.new
    @raccoon = Entities::Raccoon.new
    @mouse_listener = Components::Listeners::MouseListener.new(click, raccoon)
    @keyboard_listener = Components::Listeners::KeyboardListener.new(click, raccoon)
    @text_display = Components::Displays::TextDisplay.new(click)
    @achievements = all_achievements
  end

  def run
    add_listeners
    add_text_display
    start_refresh_loop
  end

  private

  attr_accessor :click, :text_display
  attr_reader :raccoon, :achievements, :mouse_listener, :keyboard_listener

  def start_refresh_loop
    tick = 0

    Window.update do
      if (tick % 1).zero?
        tick = 0
        text_display.update_click_text
        check_for_reached_achievements
      end
      tick += 1
    end
  end

  def add_listeners
    mouse_listener.add_listener
    keyboard_listener.add_listener
  end

  def add_text_display
    text_display.display_click_text(Window.width / 8, Window.height / 10)
  end

  def check_for_reached_achievements
    reached_achievements = achievements.select(&:requirement_met?)
    apply_achievement_multipliers(reached_achievements)
  end

  def apply_achievement_multipliers(reached_achievements)
    reached_achievements.each do |achievement|
      next if achievement.multiplier == 0.00

      if click.multipliers[achievement.name].nil?
        Components::Sounds::AchievementSound.new.play
        text_display.show_achievement_text(achievement)
      end

      click.multipliers[achievement.name] = achievement.multiplier
    end
  end

  def all_achievements
    achievements = []
    achievements << Achievements::OneThousand.new(click)
  end
end
