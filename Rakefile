require 'rspec/core/rake_task'
require_relative 'dijkstra'
require 'pry'

namespace :test do
  RSpec::Core::RakeTask.new :all
end

namespace :Dijkstra do

  task :example do
    graph = Graph.new
    graph.add_nodes %w(1 2 3 4 5 6)
    start_node = graph.node('1')
    target_node = graph.node('5')
    edges = [
        [graph.node('1'), graph.node('2'), 7  ],
        [graph.node('1'), graph.node('3'), 9  ],
        [graph.node('1'), graph.node('6'), 14 ],
        [graph.node('2'), graph.node('3'), 10 ],
        [graph.node('2'), graph.node('4'), 15 ],
        [graph.node('3'), graph.node('6'), 2  ],
        [graph.node('3'), graph.node('4'), 11 ],
        [graph.node('4'), graph.node('5'), 6  ],
        [graph.node('6'), graph.node('5'), 9  ]
    ]

    edges.each do |first_node, second_node, weight|
      graph.add_edge( first_node, second_node, weight )
    end

    dijkstra = Dijkstra.new
    shortest_path = dijkstra.find_the_shortest_path(start_node, target_node)
    puts "The shortest path is #{shortest_path}"
  end

end