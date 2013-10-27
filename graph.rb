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

  def add_edge( data = {} )
    @edges << Edge.new(data[:first_node], data[:second_node], data[:weight])
    data[:first_node].edges << @edges.last
    data[:second_node].edges << @edges.last
  end

end