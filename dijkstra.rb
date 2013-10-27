require_relative 'node.rb'
require_relative 'edge.rb'
require_relative 'graph.rb'
require 'pry'

class Dijkstra

  attr_accessor  :current_node

	def find_the_shortest_path(start_node, target_node)
		visited_nodes = []
		@current_node = start_node
		@current_node.unvisited = false
    @current_node.distance = 0
		while (target_node.unvisited) do
      visited_nodes << @current_node.name
      shortest_distance_node(@current_node)
      @current_node.unvisited = false
    end
    visited_nodes
  end


  def shortest_distance_node(node)
    current_distance = -1
    node.edges.each do |edge|
      target_node = get_target_node(edge, node)
      target_node.distance = node.distance +  edge.weight
      if target_node.unvisited
        if current_distance == -1
          @current_node = target_node
          current_distance = target_node.distance
        else
          if @current_node.distance > target_node.distance
            @current_node = target_node
          end
        end
      end
    end
    @current_node
	end

	def get_target_node(edge, node)
		node == edge.first_node ? edge.second_node : edge.first_node
	end

end

graph = Graph.new
graph.add_nodes %w(1 2 3 4 5 6)
graph.add_edge( {first_node: graph.nodes('1'), second_node: graph.nodes('2'), weight: 7} )
graph.add_edge( {first_node: graph.nodes('1'), second_node: graph.nodes('3'), weight: 9} )
graph.add_edge( {first_node: graph.nodes('1'), second_node: graph.nodes('6'), weight: 14} )
graph.add_edge( {first_node: graph.nodes('2'), second_node: graph.nodes('3'), weight: 10} )
graph.add_edge( {first_node: graph.nodes('2'), second_node: graph.nodes('4'), weight: 15} )
graph.add_edge( {first_node: graph.nodes('3'), second_node: graph.nodes('6'), weight: 2} )
graph.add_edge( {first_node: graph.nodes('3'), second_node: graph.nodes('4'), weight: 11} )
graph.add_edge( {first_node: graph.nodes('4'), second_node: graph.nodes('5'), weight: 6} )
graph.add_edge( {first_node: graph.nodes('6'), second_node: graph.nodes('5'), weight: 9} )
dijkstra = Dijkstra.new
puts dijkstra.find_the_shortest_path(graph.nodes('1'), graph.nodes('5'))