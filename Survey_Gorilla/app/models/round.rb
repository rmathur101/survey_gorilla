class Round < ActiveRecord::Base
  belongs_to :taker, class_name: "User"
  belongs_to :survey
  has_many :responses
end
