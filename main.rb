require_relative 'count_graphs'
# example 1 2 2 3 3 1 4 5
puts "Welcome please send your edges separate with a space"
puts 

print "edges = " 
user_input = gets.chomp

edges = user_input.split(' ').each_slice(2).to_a
puts "This are your edges #{edges}"


graphs = Graph.new(edges)
number_of_graphs = graphs.count_graphs

puts "Your edges made #{number_of_graphs} graphs in total"


while(user_input != 'q')
    puts
    puts 
    puts "You still can add an edge plese enter two numbers with an space in bettwen or type q to finish the program"
    print "new edge = " 
    user_input = gets.chomp
    
    edge = user_input.split(' ')
    graphs.add_edge(edge[0], edge[1])
    number_of_graphs = graphs.count_graphs
    puts "Your new edge made #{number_of_graphs} graphs in total"

end
