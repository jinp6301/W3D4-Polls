class User < ActiveRecord::Base
  attr_accessible :name

  has_many :polls, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :choices, :through => :responses
  has_many :team_members, dependent: :destroy
  has_many :teams, through: :team_members

  validates :name, presence: true
  validates :name, uniqueness: true
  # validates :name, format: { with: /\A[a-zA-Z]+\z/,
  #   message: "only allows letters" }

  def answerable_polls
    Poll.includes(:restrictions)
    .where("restrictions.team_id IN (?) OR restricted = (?)",
      self.teams.pluck(:team_id), false)
  end

end