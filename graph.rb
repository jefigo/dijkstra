require 'pry'

require_relative 'node.rb'
require_relative 'edge.rb'

class Graph

  def initialize
    @nodes = []
    @edges = []
  end

  def add_nodes( nodes = [] )
    nodes.map do |node|
      @nodes << Node.new(node)
    end
  end

  def nodes( name )
    @nodes.map do | node |
      return node if node.name == name
    end
  end

  def add_edge( first_node, second_node, weight )
    @edges << Edge.new(first_node, second_node, weight)
    first_node.edges << @edges.last
    second_node.edges << @edges.last
  end

end