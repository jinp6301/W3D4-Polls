class Poll < ActiveRecord::Base
  attr_accessible :title, :user_id, :restricted

  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :restrictions, dependent: :destroy
  has_many :teams, through: :restrictions

  validates :title, :user_id, presence: true
  validates :title, uniqueness: { scope: :user_id }
  validates :user_id, numericality: {
    only_integer: true,
    greater_than: 0
  }

  def create_question(body)
    new_question = Question.create({body: body, poll_id: self.id})
    new_question.add_choices
  end



end
