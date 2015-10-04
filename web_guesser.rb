require "sinatra"
require "sinatra/reloader"

SECRET_NUMBER = rand(100)

set :number, SECRET_NUMBER
number = settings.number

def check_guess(guess)
  message = ""
  number = settings.number
  guess = guess.to_i

  if guess == 0
    message = ""
  elsif guess > number + 5
    message = "Way to high!"
  elsif guess < number - 5
    message = "Way to low!"
  elsif guess > number
    message = "To high!"
  elsif guess < number
    message = "To low!"
  elsif guess == number
    message = "You got the right answer!"
  end
end

get '/' do
  guess = params["guess"]
  cheat = params["cheat"]
  message = check_guess(guess)
  erb :index, :locals => {
                          :number => number,
                          :message => message,
                          :cheat => cheat
                        }
end
