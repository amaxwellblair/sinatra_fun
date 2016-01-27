require 'sinatra/base'
require 'helpers/lib/game'



class AppieBirdayApp < Sinatra::Base

  set :root, File.expand_path("..", __dir__)

  before '/chicken' do

  end

  get '/' do
    Game.restart
    erb :home
  end

  get '/chicken' do
    the_game = Game.new()
    @answer = the_game.random_thing
    if the_game.current_random == "Racoon"
      @url = "http://wildlifetrappersandrescue.com/wp-content/uploads/2013/03/IMG_1338.jpg"
    else
      @url = "http://www.factzoo.com/sites/all/img/mammals/raccoon-dog.jpg"
    end
    @current_score = the_game.current_score
    erb :chicken
  end

  post '/chicken' do
    correct_answer = params['answer']
    user_answer = params['button']
    puts params['answer']
    the_game = Game.new()
    if correct_answer == user_answer
      the_game.add_point
    end
    redirect '/chicken'
  end

end
