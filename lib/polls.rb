class PollsApp

  attr_reader :current_user, :current_poll

  def initialize(name = nil)
    @current_user = PollsApp.login(name)
  end

  def self.login(name = nil)
    while name.nil?
      print "Enter your name> "
      name = gets.chomp
    end
    User.where(name: name).first_or_create
  end

  def new_poll(title)
    Poll.create(title: title, user_id: @current_user.id)
  end

  def choose_poll
    polls = Poll.where("user_id != ?", @current_user.id)
    polls.each_with_index do |poll, i|
      puts "[#{i+1}] #{poll.title}"
    end
    choice_index = nil
    until (0...polls.count).include?(choice_index)
      print "Enter the number of your choice> "
        choice_index = gets.chomp.to_i - 1
    end
    polls[choice_index]
  end

  def take_poll
    poll = choose_poll
    poll.questions.each do |question|
      puts question.body
      print "Choices are"
      question.choices.each_with_index do |choice, index|
        puts "[#{index+1}] #{choice.choice}"
      end
      choice_index = nil
      until (0...question.choices.count).include?(choice_index)
        print "Enter the number of your choice> "
        choice_index = gets.chomp.to_i - 1
      end
      Response.create(choice_id: question.choices[choice_index].id,
        user_id: @current_user.id)
    end
  end

end