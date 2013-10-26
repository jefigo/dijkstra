require_relative 'node.rb'
require_relative 'edge.rb'
require_relative 'graph.rb'
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
    @current_node.unvisited = false
    @visited_nodes << @current_node.name
	end

	def get_target_node(edge, node)
		node == edge.first_node ? edge.second_node : edge.first_node
	end

end


nodo1 = Node.new('1')
nodo2 = Node.new('2')
nodo3 = Node.new('3')
nodo4 = Node.new('4')
nodo5 = Node.new('5')
nodo6 = Node.new('6')
g = Graph.new
g.add_edge( {first_node: nodo1, second_node: nodo2, weight: 7} )
g.add_edge( {first_node: nodo1, second_node: nodo3, weight: 9} )
g.add_edge( {first_node: nodo1, second_node: nodo6, weight: 14} )
g.add_edge( {first_node: nodo2, second_node: nodo3, weight: 10} )
g.add_edge( {first_node: nodo2, second_node: nodo4, weight: 15} )
g.add_edge( {first_node: nodo3, second_node: nodo6, weight: 2} )
g.add_edge( {first_node: nodo3, second_node: nodo4, weight: 11} )
g.add_edge( {first_node: nodo4, second_node: nodo5, weight: 6} )
g.add_edge( {first_node: nodo6, second_node: nodo5, weight: 9} )
dijkstra = Dijkstra.new
dijkstra.find_the_shortest_path(nodo1, nodo5)
puts dijkstra.visited_nodes
