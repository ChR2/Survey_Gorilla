class Question < ActiveRecord::Base
  has_many :choices
  belongs_to :survey

  # 
  validates :question_text, presence: true
  
end
