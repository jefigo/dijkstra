require 'pry'

class Graph

  attr_reader :nodes, :edges


  def initialize
    @nodes = []
    @edges = []
  end

  def add_nodes( nodes = [] )
    nodes.map do |node|
      @nodes << Node.new(node)
    end
  end

  def add_edge( data = {} )
    @edges << Edge.new(data[:first_node], data[:second_node], data[:weight])
  end

end