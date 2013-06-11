class Word < ActiveRecord::Base
  attr_accessible :language, :word
  
  validates_uniqueness_of :word
  
end
