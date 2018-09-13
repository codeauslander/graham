class Node
    attr_accessor :number, :left, :right, :connections
    def initialize(number)
        @number = number
        @left = []
        @right = []
        @connections = []
    end
end

class Graph
    attr_accessor :nodes, :edges
    def initialize(edges)
        @edges = edges
        @nodes = create_nodes(edges)
    end

    def create_nodes(edges)
        nodes = []

        edges.each do |edge|

            start_node = nodes.select { |node| edge[0] === node.number}[0] || Node.new(edge[0])
            end_node = nodes.select { |node| edge[1] === node.number}[0] || Node.new(edge[1])

            end_node.left << start_node unless end_node.left.detect { |node| start_node.number === node.number}
            start_node.right << end_node unless start_node.right.detect { |node| end_node.number === node.number}

            end_node.connections << start_node unless end_node.connections.detect { |node| start_node.number === node.number}
            start_node.connections << end_node unless start_node.connections.detect { |node| end_node.number === node.number}
            
            
            nodes << start_node unless nodes.detect { |node| edge[0] === node.number}
            nodes << end_node unless nodes.detect { |node| edge[1] === node.number}
            
        end

        nodes
    end

    def add_connections(node, connections)
        # backtraking with recursivity
    end

    def count_graphs
        count = 0
        graphs = []
        graph = []
        @nodes.each do |node|
            
        end
        count
    end

    def print_nodes
        @nodes.each do |node|
            p "Node - #{node.number} | - connections: #{node.connections.map{|node| node.number}}"
        end
    end

end

# a count_graphs 2
edges_a = [[1, 2], [2, 3], [3, 1], [4, 5]] 

# b count_graphs 1
edges_b = [[1, 2], [2, 3], [3, 1], [4, 5], [4, 1], [7,1]]

# c count_graphs 3
edges_c = [[1, 2], [2, 3], [3, 1], [4, 5], [5, 6], [7, 8], [9, 8]]

graph_a = Graph.new(edges_a)
puts "Number of grahps for graph a is " + graph_a.count_graphs.to_s

graph_b = Graph.new(edges_b)
puts "Number of grahps for graph b is " + graph_b.count_graphs.to_s

graph_c = Graph.new(edges_c)
puts "Number of grahps for graph c is " + graph_c.count_graphs.to_s

puts
graph_a.print_nodes

puts
graph_b.print_nodes


