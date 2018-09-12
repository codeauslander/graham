class Node
    attr_accessor :number, :father, :connections, :graph
    def initialize(number, father = nil)
        @number = number
        @father = father
        @connections = []
        @graph = nil
    end

    def add_connection(node)
        @connections << node
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
            if  nodes.select { |node| edge[0] === node.number} === false
                start_node = Node.new(edge[0]) 

                if nodes.select { |node| edge[1] === node.number} === false
                    end_node = Node.new(edge[1], start_node) unless 
                end
            end

            
            nodes << start_node 
            nodes << end_node 

            # p nodes[-1].father
        end
        nodes
    end

    def count_graphs
        count = 1
        @nodes.each do |node|
            if (node.graph === nil)
                node.graph = count

                node.connections do |connection|
                    if connection.father
                        connection.graph = node.graph
                    end
                end
                # p node.graph
                # p node.father
                count += 1
            end
        end

        count
    end

    def print_nodes
        @nodes.each do |node|
            p "#{node.number},#{node.father},#{node.graph},#{node.connections}"
        end
    end


end

edges = [[1, 2], [2, 3], [3, 1], [4, 5]]

p Graph.new(edges)

