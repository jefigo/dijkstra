require_relative 'node.rb'
require_relative 'edge.rb'
require 'pry'

class Dijkstra

	attr_accessor  :current_node, :visited_nodes, :current_node

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

	def build_edge(first_node, second_node, weight)
		Edge.new(first_node, second_node, weight)
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
nuevo.find_the_shortest_path(nodo1, nodo5)
puts nuevo.visited_nodes
puts nuevo.current_node.distance