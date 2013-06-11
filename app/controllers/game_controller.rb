#encoding: utf-8
class GameController < ApplicationController
  def index
  	if (session[:gameword]) != nil
  		@pic = 'hangman2.png'
  		@word_to_guess = session[:gameword]
  	else
  		@pic = 'hangman1.png'
  		@word_to_guess = draw_word
  	end
  end
  
  def draw_word
  	ran_num = Random.rand(Word.count)
  	word_to_guess = Word.find(ran_num).word
  	session[:gameword] = word_to_guess
  	return word_to_guess
  end
  
  def check_letter
  end
  
  def change_picture
  end
  
  def start_new_game
  	session[:gameword] = nil
  	redirect_to game_path
  end
  
  def go_back
  	session[:gameword] = nil
  	redirect_to root_path
  end
  
end
