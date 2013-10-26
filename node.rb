require 'rspec'
require 'pry'

class Node

   attr_accessor :distance, :edges, :unvisited
   attr_reader   :name
  
  def initialize(name)
    @name = name
    @distance = -1
    @edges = [] 
    @unvisited = true
  end

end

describe Node do

  context 'new node' do

    let(:node) { Node.new('1') }

    it 'has a initializing values' do
      expect(node.distance).to eql 0
      expect(node.visited).to be_false
      expect(node.name).to eql '1'
      expect(node.edges).to eql []
    end

  end

end

