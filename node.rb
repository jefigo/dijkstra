require 'rspec'
require 'pry'

class Node

   attr_accessor :distance, :name, :visited, :edges
  
  def initialize(name)
    @name = name
    @distance = 0
    @edges = [] 
    @visited = false
  end

end

describe Node do

  context 'new node' do

    it 'has a initializing values' do
      node = Node.new('1')
      expect(node.distance).to eql 0
      expect(node.visited).to be_false
      expect(node.name).to eql '1'
      expect(node.edges).to eql []
    end

  end

end

