#encoding: utf-8
class GameController < ApplicationController
  def index
  	@pic = 'hangman1.png'
  	@word_to_gues = draw_word
  end
  
  def draw_word
  	ran_num = Random.rand(Word.count)
  	return Word.find(ran_num).word
  end
  
  def check_letter
  end
  
  def change_picture
  end
  
  
end
