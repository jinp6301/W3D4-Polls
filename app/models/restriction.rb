class Restriction < ActiveRecord::Base
  attr_accessible :poll_id, :team_id

  belongs_to :poll
  belongs_to :team

  validates :team_id, uniqueness: { scope: :poll_id }
  validates :team_id, :poll_id, presence: true
  validates :team_id, :poll_id, numericality: {
    only_integer: true,
    greater_than: 0
  }
end
