require 'rspec'
require './edge'
require './node'

describe Edge do

  let(:first_node) { Node.new('1') }
  let(:second_node) { Node.new('2') }
  let(:edge) { Edge.new( first_node, second_node, 2 ) }

  context 'when is new edge instance' do

    it 'has two nodes' do
      expect(edge.first_node).to be_an_instance_of Node
      expect(edge.second_node).to be_an_instance_of Node
    end

    it 'has a weight' do
      expect(edge.weight).to eql 2
    end
  end
end