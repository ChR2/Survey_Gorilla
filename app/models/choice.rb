class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :responses

  validates :question_id, presence: true
  validates :choice_text, presence: true
  
end
