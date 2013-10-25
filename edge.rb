require 'rspec'
require 'pry'

require_relative 'node.rb'

class Edge

  attr_accessor :first_node, :second_node
  attr_reader :weight

  def initialize(first_node, second_node, weight)
    @first_node = first_node
    @second_node = second_node
    @weight = weight
  end

end


describe Edge do
  context 'new edge' do
    let(:first_node) { Node.new('1') }
    let(:second_node) { Node.new('2') }
    let(:edge) { Edge.new( first_node, second_node, 2 ) }

    it 'has two nodes' do
      expect(edge.first_node).to be_an_instance_of Node
      expect(edge.second_node).to be_an_instance_of Node
    end

    it 'has a weight' do
      expect(edge.weight).to eql 2
    end
  end
end