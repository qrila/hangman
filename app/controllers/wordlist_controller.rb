#encoding: utf-8
class WordlistController < ApplicationController
  def index
	@words = Word.order('word ASC').all
	
	
  end
  
  def add_word
		new_word = params[:new_word].downcase
		addword = Word.new(:word => new_word, :language => 'fi')
	
		respond_to do |format|
			if addword.save
				format.html { redirect_to words_path, notice: 'Lisääminen onnistui' }
			else
				format.html { redirect_to words_path, notice: 'Sana löytyi jo tai jotain meni vikaan' }
			end
		end
  end
	
end
