class Survey < ActiveRecord::Base
  has_many :questions
  has_many :responses
  belongs_to :user

 
  validates :name, presence: true

end
