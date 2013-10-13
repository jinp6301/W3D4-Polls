class Team < ActiveRecord::Base
  attr_accessible :name

  has_many :team_members
  has_many :users, through: :team_members
  has_many :restrictions, dependent: :destroy
  has_many :polls, through: :restrictions
end
