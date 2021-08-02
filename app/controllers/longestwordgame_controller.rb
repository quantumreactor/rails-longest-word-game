require 'open-uri'
require 'json'

class LongestwordgameController < ApplicationController
  def start

  end

  def new
    @letters = []
    (0..9).each do |num|
      @letters[num] = ('a'..'z').to_a.sample
    end
    @letters
  end

#   {
#     "found": true,
#     "word": "palabra",
#     "length": 7
# }
#  {
# "found": false,
# "word": "zzzz",
# "error": "word not found"

# }


  def score
    @response = ''
    @my_word = params[:myword]
    @the_letters = params[:theletters]
    if included?(@my_word, @the_letters)
      if valid_word?(@my_word)
        @response = "Congratulations! #{@my_word} is a valid word!"
      else
        @response = "Sorry but #{@my_word} can not be built ouf of #{@the_letters}"
      end
    else
      @response = "sorry, but #{@my_word} does not seem to be a valid word."
    end
    @response
  end

  def valid_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end

  def included?(guess, grid)
    guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }
  end

end
