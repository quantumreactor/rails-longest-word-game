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

  def score
    @response = ''
    @my_word = params[:myword]
    @the_letters = params[:theletters]
    return @response = 'Please enter a word next time' || store_score(0) if @my_word == ''

    if included?(@my_word, @the_letters)
      if valid_word?(@my_word)
        @response = "Congratulations! #{@my_word} is a valid word!"
        store_score(5)
      else
        @response = "Defeat! Sorry, but #{@my_word} does not seem to be a valid word."
        store_score(-3)
      end
    else
      @response = "Sorry but #{@my_word} can not be built ouf of #{@the_letters}"
      store_score(-5)
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

  private

  def store_score(score)
    session[:total_score] = 0 if session[:total_score].nil?
    session[:total_score] += score.to_i
  end

end
