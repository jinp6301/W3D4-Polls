class TeamMember < ActiveRecord::Base
  attr_accessible :team_id, :user_id

  belongs_to :user
  belongs_to :team

  validates :team_id, :user_id, presence: true
  validates :team_id, :user_id, numericality: {
    only_integer: true,
    greater_than: 0
  }

end
