Gem::Specification.new do |s|
  s.name               = "rbutils"
  s.version            = "0.0.4"

  s.authors = ["manan"]
  s.date = %q{2014-06-19}
  s.description = %q{Utilities for enhanced functionality. Includes Graph, Sorting, Parsing, and a Neural Network implemenation. Source is at https://github.com/mananshah99/rbutils. }
  s.email = %q{manan.shah.777@gmail.com}
  s.files = [
             "lib/rbutils.rb", 
             "lib/rbutils/neuralnet/neuralnetwork.rb",
             "lib/rbutils/graph/bfs.rb",
             "lib/rbutils/graph/dfs.rb",
             "lib/rbutils/graph/dijkstra.rb",
             "lib/rbutils/graph/edge.rb",
             "lib/rbutils/graph/graph.rb",
             "lib/rbutils/graph/node.rb",
             "lib/rbutils/graph/priorityqueue.rb",
             "lib/rbutils/sort/bubblesort.rb",
             "lib/rbutils/sort/quicksort.rb"
             ]
  s.require_paths = ["lib"]
  s.homepage    = 'https://rubygems.org/gems/rbutils'
  s.summary = %q{Multifaceted utilities for Ruby.}
  s.licenses    = ['Apache']
end