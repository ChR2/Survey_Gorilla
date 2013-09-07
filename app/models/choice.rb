class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :responses


  validates :choice_text, presence: true
  
end
