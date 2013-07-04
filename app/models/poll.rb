class Poll < ActiveRecord::Base
  attr_accessible :title, :user_id

  belongs_to :user
  has_many :questions, dependent: :destroy

  validates :title, :user_id, presence: true
  validates :title, uniqueness: { scope: :user_id }
  validates :user_id, numericality: {
    only_integer: true,
    greater_than: 0
  }

  def create_question(body)
    Question.create({body: body, poll_id: @current_poll.id}).add_choices
  end


end
