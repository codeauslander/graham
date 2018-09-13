require 'minitest/autorun'
require_relative 'count_graphs'

class CountGraphsTest < Minitest::Test
    def test_example
        edges = [[1, 2], [2, 3], [3, 1], [4, 5]]
        number_of_graphs = Graph.new(edges).count_graphs
        assert_equal 2, number_of_graphs
    end

    def test_example_with_2_5_connection
        edges = [[1, 2], [2, 3], [3, 1], [4, 5]]
        graphs = Graph.new(edges)
        graphs.add_edge(2,5)
        number_of_graphs = graphs.count_graphs
        assert_equal 1, number_of_graphs
    end

    def test_with_four_graphs
        edges = [[1, 2], [2, 3], [3, 1], [4, 5], [5, 6], [7, 8], [9, 8], [10,10]]
        graphs = Graph.new(edges)
        number_of_graphs = graphs.count_graphs
        assert_equal 4, number_of_graphs
    end

    def test_with_four_graphs
        edges = [[1, 2], [2, 3], [3, 1], [4, 5], [5, 6], [7, 8], [9, 8], [10,10]]
        graphs = Graph.new(edges)
        number_of_graphs = graphs.count_graphs
        assert_equal 4, number_of_graphs
    end
end
