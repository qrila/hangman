#encoding: utf-8
class WordlistController < ApplicationController
  def index
	@words = Word.order('word ASC').all
	
	
  end
  
  def add_word
	if params[:new_word] != ''
		new_word = params[:new_word].downcase
		new_word.gsub!('Ä', 'ä')
		new_word.gsub!('Ö', 'ö')
		new_word.gsub!('Å', 'å')
		addword = Word.new(:word => new_word, :language => 'fi')
	
		respond_to do |format|
			if addword.save
				format.html { redirect_to words_path, notice: 'Lisääminen onnistui' }
			else
				format.html { redirect_to words_path, notice: 'Sana löytyi jo tai jotain meni vikaan' }
			end
		end
	else
		respond_to do |format|
			format.html { redirect_to words_path, notice: 'Tyhjä ei kelpaa' }
		end
	  end
	end
end
