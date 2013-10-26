require_relative 'node.rb'
require_relative 'edge.rb'
require 'pry'

class Dijkstra

  attr_accessor  :current_node, :visited_nodes

  def find_the_shorter_path(start_node, target_node)
    @visited_nodes = []
    @current_node = start_node
    @current_node.unvisited = false
    while (target_node.unvisited) do
      low_distance_node(@current_node)
      binding.pry
    end
  end


  def low_distance_node(node)
    current_distance = @current_node.distance
    node.edges.each do |edge|
      origin, destination = get_the_origin_and_destination_nodes(edge, node)
      node.distance = @current_node.distance + edge.weight
      if destination.unvisited
        if (current_distance == -1 ) or (current_distance < node.distance )
          current_distance = node.distance + edge.weight
          @current_node = destination
        end
      end
    end
    @visited_nodes << @current_node
    @current_node.unvisited = false
    @current_node.distance
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
nuevo = Dijkstra.new
nuevo.build_edge(nodo1, nodo2, 7)
nuevo.build_edge(nodo1, nodo3, 9)
nuevo.build_edge(nodo1, nodo6, 14)

nuevo.build_edge(nodo2, nodo3, 10)
nuevo.build_edge(nodo2, nodo4, 15)
nuevo.build_edge(nodo3, nodo6, 2)
nuevo.build_edge(nodo3, nodo4, 11)
nuevo.build_edge(nodo4, nodo5, 6)
nuevo.build_edge(nodo6, nodo5, 9)
nuevo.find_the_shorter_path(nodo1, nodo5)
puts nuevo.visited_nodes

