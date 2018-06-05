# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
i = 1
5.times do
  title = [
    'Things to Do',
    'Things to See',
    'Places to Go',
    'People to Meet',
    'Foods to Eat',
    'Drinks to Drink',
    'Wars to Win',
    'Swings to Swing',
    'Chores to Do',
    'Authority Figures to Insult'][rand(9)+1]
  Board.create(name: "board#{i}", priority: i, title: title)
  puts "Creating board number #{i} at priority: #{i}"
  i += 1
end

i = 1
Board.all.each do
  5.times do
    name = [
      'Budapest',
      'Romania',
      'Kazakhstan',
      'Turkey',
      'Gravy Boat',
      'Mashed Potato',
      'Cranberry',
      'Random Fruit',
      'Jack the Ripper',
      'Jack and the Beanstalk',
      'Georgia on My Mind',
      'Stevie Wonder',
      'Dream a Better World',
      'Maynard James Keenan',
      'John Lennon',
      'Jerry Lewis',
      'Malcolm in the Middle',
      'Shark',
      'Sharky',
      'Do not ask about this',
      'It is always Sunny in Philadelphia',
      'Cheeseburger',
      'Cheeseburger and Fry',
      'The Happiest Cheeseburger'
    ][rand(23) + 1]
    desc = [
      'Somewhere in the blue dream...',
      'Around your house to the left',
      'Second star to the right',
      'Straight on till morning',
      'Down the rabbit hole',
      'Excellent cheeseburgers!',
      'I wish I was like you',
      'Easily amused',
      'Art is theft',
      'Theft is art',
      'Pablo Picasso must have known',
      'You better ask somebody'
    ][rand(12) + 1]
    List.create(name: name, desc: desc, priority: i, board_id: i)
    puts "Creating list on board #{i}: Priority #{i}, Name: #{name}, Desc: #{desc}"
  end
  i += 1
end

