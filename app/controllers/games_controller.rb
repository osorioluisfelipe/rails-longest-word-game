require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters_array = ('A'..'Z').to_a.sample(7)
  end

  def json_word(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    word_serialized = URI.open(url).read
    word_json = JSON.parse(word_serialized)
    word_json["found"]
  end

  def includes(word, letters)
    word_arr = word.split('')
    word_size = 0
    word_arr.each do |letter|
      word_size += 1 if letters.include?(letter)
    end
    word_size
  end

  def score
    word = params[:word].downcase
    letters = params[:letters].downcase
    word_size = includes(word, letters)
    if word_size != word.size
      @message = "Sorry but #{word.upcase} can't be built out of #{letters.upcase}"
    elsif json_word(word) == false
      @message = "Sorry but #{word.upcase} does not seem to be a valid English word..."
    else
      @message = "Congratulations!#{word.upcase} is a valid English word!"
    end
  end
end
