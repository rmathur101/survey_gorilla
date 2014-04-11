class Round < ActiveRecord::Base
  belongs_to :taker, class_name: "User"
  belongs_to :survey
  has_many :responses

  def self.round_complete?(round_id)
    round = Round.find(round_id)
    question_count = round.survey.questions.count
    taker_responses = round.taker.responses.where(round_id: round_id).count
    return question_count == taker_responses
  end

  def self.set_round_complete(round_id)
    if round_complete?(round_id)
      round = Round.find(round_id)
      round.taken = round_complete?(round_id)
      round.save
    end
  end
end
