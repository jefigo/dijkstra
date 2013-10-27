require 'rspec'
require './dijkstra'

describe Dijkstra do

  let(:graph) { Graph.new }
  let(:edges) { [
      [ graph.node('1'), graph.node('2'), 7  ],
      [ graph.node('1'), graph.node('3'), 9  ],
      [ graph.node('1'), graph.node('6'), 14 ],
      [ graph.node('2'), graph.node('3'), 10 ],
      [ graph.node('2'), graph.node('4'), 15 ],
      [ graph.node('3'), graph.node('6'), 2  ],
      [ graph.node('3'), graph.node('4'), 11 ],
      [ graph.node('4'), graph.node('5'), 6  ],
      [ graph.node('6'), graph.node('5'), 9  ]
  ] }

  let(:dijkstra) { Dijkstra.new}
  let(:start_node) { graph.node('1') }

  before do
    graph.add_nodes %w(1 2 3 4 5 6)
    edges.each do |first_node, second_node, weight|
      graph.add_edge( first_node, second_node, weight )
    end
  end

  context '#find_the_shortest_path' do

    let(:target_node) { graph.node('5') }

    it 'returns the shortest path between a start node and a target node' do
      expect(dijkstra.find_the_shortest_path(start_node, target_node )).to eql ['1', '2', '3', '6']
    end
  end

  context '#shortest_distance_node' do

    let(:target_node) { graph.node('2') }

    it 'returns the shortest distance node' do
      expect(dijkstra.shortest_distance_node(start_node)).to eql target_node
    end
  end

  context '#get_target_node' do

    let(:target_node) { graph.node('2') }
    let(:weight) { 7 }
    let(:edge) { Edge.new( start_node, target_node, weight ) }

    it 'returns the target node in a given edge' do
      expect(dijkstra.get_target_node(edge, start_node)).to eql target_node
    end
  end

end