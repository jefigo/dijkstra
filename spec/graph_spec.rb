require 'rspec'
require 'pry'
require './graph'

describe Graph  do

  let(:graph) { Graph.new }
  let(:nodes) { %w( uno dos ) }

  context 'when is new graph instance' do
    it 'does not have nodes' do
      expect(graph.nodes).to eql []
    end

    it 'does not have edges' do
      expect(graph.edges).to eql []
    end
  end

  context '#add_nodes' do
    it 'adds two nodes' do
      expect{graph.add_nodes(nodes)}.to change{graph.nodes.count}.by(2)
      expect(graph.nodes[0].name).to eql 'uno'
      expect(graph.nodes[1].name).to eql 'dos'
    end
  end

  context '#node' do
    before do
      graph.add_nodes(nodes)
    end

    it 'returns a node by its name' do
      expect(graph.node('uno').name).to eql 'uno'
    end
  end

  context '#add_edge' do
    let(:weight) { 7 }
    let(:first_node) { graph.node('uno') }
    let(:second_node) { graph.node('dos') }

    before do
      graph.add_nodes(nodes)
    end

    it 'adds an edge to the graph' do
      expect{graph.add_edge(first_node, second_node, weight)}.to change{graph.edges.count}.by(1)
    end

    it 'adds an edge to the given nodes' do
      expect{graph.add_edge(first_node, second_node, weight)}.to change{first_node.edges.count}.by(1)
      expect{graph.add_edge(first_node, second_node, weight)}.to change{second_node.edges.count}.by(1)
    end
  end
end