$LOAD_PATH.unshift(File.expand_path("..", __dir__))
require 'lib/game'
require 'minitest'
require 'minitest/autorun'

class GameTest < Minitest::Test
  attr_reader :the_game

  def setup
    @the_game = Game.new
    the_game.restart
  end

  def test_its_exisitence
    assert the_game
  end

  def test_current_score
    assert_equal 0, the_game.current_score
  end

  def test_adding_points
    the_game.add_point
    assert_equal 1, the_game.current_score
  end



  def test_random_thing
    the_game.random_thing
    assert the_game.current_random == "Racoon" || the_game.current_random == "Dog"
  end

end
