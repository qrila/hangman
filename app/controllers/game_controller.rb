#encoding: utf-8
class GameController < ApplicationController
  def index
  	if (session[:gameword]) != nil
  	  
  	  if session[:gamestate] < 10
  	    session[:gamestate] += 1
  	  end
  	  
  		@pic = session[:gamestate].to_s + 'hangman.png'
  		@word_to_guess = session[:gameword]
  		
  	else
  	  session[:gamestate] = 1
  		@pic = 1.to_s + 'hangman.png'
  		@word_to_guess = draw_word
  		
  	end
  end
  
  def draw_word
		word_to_guess = Word.offset(rand(Word.count)).first.word
  	word_to_guess.upcase!

		word_to_guess.gsub!('ä', 'Ä')
		word_to_guess.gsub!('ö', 'Ö')
		word_to_guess.gsub!('å', 'Å')
  	
  	session[:gameword] = word_to_guess
  	return word_to_guess
  end
  
  def checkletter
    redirect_to game_path
  end
  
  def change_picture
  end
  
  def start_new_game
    session[:gamestate] = nil
  	session[:gameword] = nil
  	redirect_to game_path
  end
  
  def go_back
    session[:gamestate] = nil
  	session[:gameword] = nil
  	redirect_to root_path
  end
  
end
