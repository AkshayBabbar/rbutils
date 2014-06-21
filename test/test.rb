require 'rbutils'
require 'test/unit'
require 'pp'

class RUtilsTest < Test::Unit::TestCase
  def test_dijkstra
    g = Graph.new
    
    g.add_node(n0 = Node.new("A"))
    g.add_node(n1 = Node.new("B"))
    g.add_node(n2 = Node.new("C"))
    g.add_node(n3 = Node.new("D"))
    g.add_node(n4 = Node.new("E"))
    g.add_node(n5 = Node.new("F"))
    g.add_node(n6 = Node.new("G"))
    g.add_node(n7 = Node.new("H"))
    
    g.add_edge(n0, n1, 5)
    g.add_edge(n0, n4, 2)
    g.add_edge(n0, n7, 8)
    g.add_edge(n4, n7, 5)
    g.add_edge(n6, n2, 4)
    g.add_edge(n5, n6, 15)
    g.add_edge(n7, n5, 4)
    g.add_edge(n3, n6, 2)
    g.add_edge(n4, n5, 40)
    g.add_edge(n4, n6, 1)
    g.add_edge(n7, n2, 7)
    
    sp = Dijkstra.new(g, n4).path_to(n2)
    sp = sp.map(&:to_str).to_a
    eq = Array.new(["E", "G", "C"])
    
    assert sp == eq  
    
    p "[test]  Dijkstra test complete"
  end
  
  def test_neuralnet
    learning_rate = 10 #|rate|
    momentum_rate = 1 #|momentum|
    
    neural_net = NeuralNetwork.new(:inputs => 2, :hidden_nodes => 10, :output_nodes => 1)
    
    10000.times do |i|
      neural_net.train([0, 0], [0], learning_rate, momentum_rate)
      neural_net.train([0, 1], [0], learning_rate, momentum_rate)
      neural_net.train([1, 0], [0], learning_rate, momentum_rate)
      neural_net.train([1, 1], [1], learning_rate, momentum_rate)
    end

    assert neural_net.predict([0, 0]).round.to_s == "0"
    assert neural_net.predict([1, 0]).round.to_s == "0"
    assert neural_net.predict([0, 1]).round.to_s == "0"
    assert neural_net.predict([1, 1]).round.to_s == "1"
    
    p "[test]  Neural Network test complete"
  end
   
end
