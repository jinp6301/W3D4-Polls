class Question < ActiveRecord::Base
  attr_accessible :poll_id, :body

  belongs_to :poll
  has_many :choices, dependent: :destroy
  has_many :responses, through: :choices
  has_one :author, through: :poll, source: :user

  validates :poll_id, :body, presence: true
  validates :body, uniqueness: { scope: :poll_id }
  validates :poll_id, numericality: {
    only_integer: true,
    greater_than: 0
  }

end
