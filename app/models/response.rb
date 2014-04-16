class Response < ActiveRecord::Base

  belongs_to :choice
  belongs_to :round
  delegate :question, to: :choice # belongs_to won't work here.
  delegate :taker, to: :round

end
