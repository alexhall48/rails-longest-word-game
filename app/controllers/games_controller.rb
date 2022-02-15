require 'open-uri'
require 'json'


class GamesController < ApplicationController

  def new
    @letters = Array.new(10) { ("a".."z").to_a.sample }
  end

  def score
    @answer = params[:answer]
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    dictionary = JSON.parse(URI.open(url).read)
    if dictionary["found"] == true
      return "#{@answer} is a valid word"
    else
      return "Not a valid word"
    end
  end

end

#take the letters from the grid
#take the letters from the input use .downcase
#are the letters matching
#check if it is a valid word - completed
