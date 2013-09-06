class Survey < ActiveRecord::Base
  has_many :questions
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true

end
