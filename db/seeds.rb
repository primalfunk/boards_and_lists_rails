require 'faker'

i = 1
5.times do
  title = Faker::Pokemon.name
  Board.create(name: "board#{i}", priority: i.to_i, title: title)
  puts "Creating board number #{i} at priority: #{i}"
  i += 1
end

i = 1
j = 1
Board.all.each do
  5.times do
    name = "list" + j.to_s
    desc = Faker::RickAndMorty.quote
    if desc.length > 100
      desc = desc[0, 100]
    end
    List.create(name: name, desc: desc, priority: j.to_i, board_id: i.to_i)
    puts "Creating list on board #{i}: Priority #{j}, Name: #{name}, Desc: #{desc}"
    j += 1
  end
  i += 1
  j = 1
end

i = 1
j = 1
List.all.each do
  5.times do
    name = "task" + j.to_s
    desc = Faker::Simpsons.quote
    priority = j.to_i
    list_id = i.to_i
    Task.create(name: name, desc: desc, priority: priority, list_id: list_id)
    puts "Creating task on List #{i}: Priority #{j}, Name: #{name}, Desc: #{desc}"
    j += 1
  end
  i += 1
  j = 1
end
    

