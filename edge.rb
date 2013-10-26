require 'rspec'
require 'pry'
require_relative 'node.rb'

class Edge

  attr_reader  :first_node, :second_node, :weight

  def initialize(first_node, second_node, weight)
    @first_node = first_node
    @second_node = second_node
    @weight = weight
    add_edge
  end


  def add_edge
    @first_node.edges << self
    @second_node.edges << self
  end

end


describe Edge do


  let(:first_node) { Node.new('1') }
  let(:second_node) { Node.new('2') }
  let(:edge) { Edge.new( first_node, second_node, 2 ) }

  context 'new edge' do

    it 'has two nodes' do
      expect(edge.first_node).to be_an_instance_of Node
      expect(edge.second_node).to be_an_instance_of Node
    end

    it 'has a weight' do
      expect(edge.weight).to eql 2
    end
  end

  describe '#add_edge' do

    before do
      edge.add_edge
    end

    it 'add on edge' do
      expect(first_node.edges[0]).to eql edge
      expect(second_node.edges[0]).to eql edge
    end

  end
end