require_relative 'node.rb'
require_relative 'edge.rb'
require_relative 'graph.rb'

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


  def shortest_distance_node(start_node)
    current_distance = -1
    start_node.edges.each do |edge|
      target_node = get_target_node(edge, start_node)
      target_node.distance = start_node.distance +  edge.weight
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