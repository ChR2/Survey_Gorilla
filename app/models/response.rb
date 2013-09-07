class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :choice
  belongs_to :survey
  validates :user_id, presence: true
  validates :choice_id, presence: true

end
