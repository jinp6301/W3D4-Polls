class User < ActiveRecord::Base
  attr_accessible :name

  has_many :polls, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :choices, :through => :responses

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

end