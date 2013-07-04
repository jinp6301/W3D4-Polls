class Choice < ActiveRecord::Base
  attr_accessible :choice, :question_id

  belongs_to :question
  has_many :responses, dependent: :destroy
  has_many :respondants, through: :responses, source: :users
  has_one :poll, through: :question

  validates :choice, :question_id, presence: true
  validates :choice, uniqueness: { scope: :question_id }
  validates :question_id, numericality: {
    only_integer: true,
    greater_than: 0
  }

end
