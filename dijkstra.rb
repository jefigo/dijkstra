require_relative 'node.rb'
require_relative 'edge.rb'
require 'pry'

class Dijkstra

	attr_accessor  :current_node, :visited_nodes

	def find_the_shortest_path(start_node, target_node)
		@visited_nodes = []
		@current_node = start_node
		@current_node.unvisited = false
    @current_node.distance = 0
		while (target_node.unvisited) do
			shortest_distance_node(@current_node)
		end
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
		@visited_nodes << @current_node.name
		@current_node.unvisited = false
	end

	def get_target_node(edge, node)
		node == edge.first_node ? edge.second_node : edge.first_node
	end

end

