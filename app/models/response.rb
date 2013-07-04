class Response < ActiveRecord::Base
  attr_accessible :choice_id, :user_id

  belongs_to :user
  belongs_to :choice
  has_one :question, through: :choice

  validates :choice_id, :user_id, presence: true
  validates :choice_id, :user_id, numericality: {
    only_integer: true,
    greater_than: 0
  }
  validate :one_response_per_question_per_user,
    :author_doesnt_answer_own_question

  # Validations
  def one_response_per_question_per_user
    if self.question.responses.include?(Response.where(user_id: @user_id))
      errors.add(:user_id, "You have already answered this question")
    end
  end

  def author_doesnt_answer_own_question
    if self.question.author.id == @user_id
      errors.add(:choice_id, "You cannot answer your own question.")
    end
  end


end

