class User < ActiveRecord::Base

  include BCrypt

  has_secure_password

  validates :name, :length => { :minimum => 3, :message => "must be at least 3 characters, fool!" }
  # validates :entered_password, :length => { :minimum => 6 }
  validates :email, :uniqueness => true, :format => /.+@.+\..+/ # imperfect, but okay

  has_many :surveys , foreign_key: "creator_id"
  has_many :rounds, foreign_key: "taker_id"
  has_many :responses, through: :rounds

end
