$LOAD_PATH.unshift(File.expand_path("../../"))
class Game
  attr_accessor :current_random, :file_extension

  def initialize
    @current_score = 0
    @file_extension = "models/basic.txt"
  end

  def current_score
    x = File.read(file_extension)
    return x.to_i
  end

  def add_point
    File.write(file_extension, current_score+1)
  end

  def random_thing
    random_things = %w(Racoon Dog)
    @current_random = random_things.shuffle.first
    return current_random
  end

  def self.restart
    game = self.new
    File.write(game.file_extension, 0)
  end

end
