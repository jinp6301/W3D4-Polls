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

  def results
    choices.joins(:responses).group("choices.choice").count
  end

  def edit_body(body)
    self.body = body
    save
  end

  def add_choices
    choice = nil
    while choice != "--quit"
      puts "Enter choice for question (--quit when finished)>"
      choice = gets.chomp
      unless choice.empty? || choice == "--quit"
        Choice.create({choice: choice, question_id: self.id})
      end
    end
  end

end
