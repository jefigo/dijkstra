require_relative 'node.rb'
require_relative 'edge.rb'
require 'pry'

class Dijkstra

  attr_accessor  :current_node, :total_distance, :start_node, :end_node, :visited_nodes

  def initialize(start_node, end_node)
    @visited_nodes = []
    @start_node = start_node
    @end_node = end_node
    @current_node = start_node
    @current_node.visited = true
  end

  def find
    @total_distance = 0
    distance = get_the_lower_edge_distance(@current_node)
    @total_distance = @total_distance + distance
  end


  def get_the_lower_edge_distance(node)
    current_distance = 0
    node.edges.each do |edge|
      origin, destination = get_the_origin_and_destination_nodes(edge, node)
      unless destination.visited
        if (current_distance < edge.weight)
          current_distance = edge.weight
          @current_node = destination
        end
      end
    end
    @visited_nodes << @current_node
    @current_node.visited = true
    current_distance
  end

  def build_edge(first_node, second_node, weight)
    Edge.new(first_node, second_node, weight)
  end

  def get_the_origin_and_destination_nodes(edge, node)
    if node == edge.first_node
      [edge.first_node, edge.second_node]
    else
      [edge.second_node, edge.first_node]
    end
  end

  def is_the_end_node?(node)
    node == @end_node ? true : false
  end

end


nodo1 = Node.new('1')
nodo2 = Node.new('2')
nodo3 = Node.new('3')
nodo4 = Node.new('4')
nodo5 = Node.new('5')
nodo6 = Node.new('6')
nuevo = Dijkstra.new(nodo1, nodo5)
nuevo.build_edge(nodo1, nodo2, 7)
nuevo.build_edge(nodo1, nodo3, 9)
nuevo.build_edge(nodo1, nodo6, 14)
nuevo.build_edge(nodo2, nodo3, 10)
nuevo.build_edge(nodo2, nodo4, 15)
nuevo.build_edge(nodo3, nodo6, 2)
nuevo.build_edge(nodo3, nodo4, 11)
nuevo.build_edge(nodo4, nodo5, 6)
while (!nuevo.end_node.visited)
  nuevo.find()
  binding.pry
end
puts nuevo.visited_nodes

