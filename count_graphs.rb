class Node
    attr_accessor :number, :connections
    def initialize(number)
        @number = number
        @connections = []
    end
end

class Graph
    attr_accessor :nodes, :edges
    def initialize(edges)
        raise 'At least one edge is necessary' unless edges[0]
        @edges = edges
        @nodes = create_nodes(edges)
    end

    def create_nodes(edges)
        nodes = []

        edges.each do |edge|

            start_node = nodes.select { |node| edge[0] === node.number}[0] || Node.new(edge[0])
            end_node = nodes.select { |node| edge[1] === node.number}[0] || Node.new(edge[1])

            end_node.connections << start_node unless end_node.connections.detect { |node| start_node.number === node.number}
            end_node.connections << end_node unless end_node.connections.detect { |node| end_node.number === node.number}

            start_node.connections << end_node unless start_node.connections.detect { |node| end_node.number === node.number}
            start_node.connections << start_node unless start_node.connections.detect { |node| start_node.number === node.number}
            
            
            nodes << start_node unless nodes.detect { |node| edge[0] === node.number}
            nodes << end_node unless nodes.detect { |node| edge[1] === node.number}
            
        end

        nodes
    end

    def intersections
        graph = @nodes[0].connections.map{|node| node.number }
        graphs = []
        index = 1

        while(index < @nodes.length)
            connections = @nodes[index].connections.map{|node| node.number }

            if (connections & graph)[0] != nil
                graph = (graph + connections).uniq
            else
                graphs << graph
                graph = connections          
            end

            index += 1
        end

        graphs << graph if (connections & graph)[0] != nil
        graphs
    end

    def count_graphs
        intersections.length
    end

    def print_nodes
        @nodes.each do |node|
            p "Node - #{node.number} | connections: #{node.connections.map{|node| node.number}} "
        end
    end

end

puts
puts 
puts 

# a count_graphs 2
edges_a = [[1, 2], [2, 3], [3, 1], [4, 6], [5,7]] 

# b count_graphs 1
edges_b = [[1, 2], [2, 3], [3, 1], [4, 5], [4, 1], [7,1]]

# c count_graphs 4
edges_c = [[1, 2], [2, 3], [3, 1], [4, 5], [5, 6], [7, 8], [9, 8], [10,10]]

group_a = Graph.new(edges_a)
puts "Number of grahps for group a is " + group_a.count_graphs.to_s

group_b = Graph.new(edges_b)
puts "Number of grahps for group b is " + group_b.count_graphs.to_s

group_c = Graph.new(edges_c)
puts "Number of grahps for group c is " + group_c.count_graphs.to_s

puts
group_a.print_nodes

puts
group_b.print_nodes

puts 
group_c.print_nodes

puts
puts "interceptions for group a"
p group_a.intersections

puts "interceptions for group b"
p group_b.intersections

puts "interceptions for group c"
p group_c.intersections



