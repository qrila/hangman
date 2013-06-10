#encoding: utf-8
class WordlistController < ApplicationController
  def index
	@words = Word.all
	@addword
	
  end
  def add_word
	
  end
  def create
		@addword = Word.new(params[:word])
	
		respond_to do |format|
			if @addword.save
				format.html { redirect_to words_path, notice: 'Lisääminen onnistui' }
			else
				format.html
			end
		end
	end
end
