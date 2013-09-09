class Question < ActiveRecord::Base
  has_many :choices
  has_many :responses, through: :choices
  belongs_to :survey

 
  validates :question_text, presence: true
  
  def times_answered
    self.responses.count
  end

end
