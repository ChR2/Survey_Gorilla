class Question < ActiveRecord::Base
  has_many :choices
  belongs_to :survey

  validates :survey_id, presence: true
  validates :question_text, presence: true
  
end
