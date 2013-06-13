#encoding: utf-8
class GameController < ApplicationController
  def index
  	if (session[:gameword]) != nil
  	    	  
  		@pic = session[:gamestate].to_s + 'hangman.png'
  		@word_to_guess = session[:gameword]
  		@guessed = session[:guessed_characters]
  		
  		@state = session[:gamestate]
  		@rights = session[:right_characters]
  		
  		@gamelose = 0
  	  @gamewin = 0
      if session[:gamestate] > 9
        @gamelose = 1
        @gamewin = 0
      elsif session[:right_characters] == @word_to_guess.length
        @gamelose = 0
        @gamewin = 1
      end
  		
  	else
  	  session[:gamestate] = 1
  		@pic = 1.to_s + 'hangman.png'
  		@word_to_guess = draw_word
  		@guessed = session[:guessed_characters] = ''
  		session[:right_characters] = 0
  		
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
    guessed_character = params[:id]
    
    guessed_character.gsub!('AE', 'Ä')
    guessed_character.gsub!('OE', 'Ö')
    guessed_character.gsub!('AO', 'Å')
    
    session[:guessed_characters] = session[:guessed_characters] + guessed_character
    
    if !(session[:gameword].index(guessed_character))
      session[:gamestate] = session[:gamestate] + 1
    else
      session[:right_characters] != nil ? 
                  session[:right_characters] = session[:right_characters] + session[:gameword].count(guessed_character) :
                  session[:right_characters] = session[:gameword].count(guessed_character)
    end
    
    redirect_to game_path
  end
  
  def change_picture
  end
  
  def start_new_game
    session[:gamestate] = nil
  	session[:gameword] = nil
  	session[:guessed_characters] = nil
  	session[:right_characters] = nil
  	redirect_to game_path
  end
  
  def go_back
    session[:gamestate] = nil
  	session[:gameword] = nil
  	session[:guessed_characters] = nil
  	session[:right_characters] = nil
  	redirect_to root_path
  end
  
end
