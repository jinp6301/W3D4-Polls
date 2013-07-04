# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = User.create([{name: "Willem van Daalen"},
  {name: "Jin Park"},
  {name: "Jonathan"},
  {name: "Samwise"}])
polls = Poll.create([
  {title: "CS Stuff", user_id: 1},
  {title: "Other Sheet", user_id: 1},
  {title: "Way better poll than those two.", user_id: 2}])
questions = Question.create([
  {poll_id: 1,body: "Favorite programming language"},
  {poll_id: 1,body: "Favorite text editor"},
  {poll_id: 2,body: "Favorite painter"},
  {poll_id: 3,body: "Food you hate"}])
choices = Choice.create([
  {choice: 'Ruby', question_id: 1},
  {choice: 'Java', question_id: 1},
  {choice: 'Python', question_id: 1},
  {choice: 'TextMate', question_id: 2},
  {choice: 'vi', question_id: 2},
  {choice: 'Monet', question_id: 3},
  {choice: 'Picasso', question_id: 3},
  {choice: 'Pizza', question_id: 4},
  {choice: 'Burgers', question_id: 4},
  {choice: 'None of the above', question_id: 4}
])
responses = Response.create([
  {choice_id: 1, user_id: 3},
  {choice_id: 2, user_id: 2},
  {choice_id: 2, user_id: 4}
])