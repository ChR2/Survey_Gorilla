class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :choice

  validates :user_id, presence: true
  validates :choice_id, presence: true

end
