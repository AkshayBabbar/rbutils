#this needs to be changed to conform to gemspec standards
# it needs to allow for user interface with the different classes provided. 
class RUtils
  def test_neuralnet() 
        learning_rate = 10 #|rate|
        momentum_rate = 1 #|momentum|

        neural_net = NeuralNetwork.new(:inputs => 2, :hidden_nodes => 10, :output_nodes => 1)

        10000.times do |i|
             neural_net.train([0, 0], [0], learning_rate, momentum_rate)
             neural_net.train([0, 1], [0], learning_rate, momentum_rate)
             neural_net.train([1, 0], [0], learning_rate, momentum_rate)
             neural_net.train([1, 1], [1], learning_rate, momentum_rate)
        end

        puts "[0, 0] -> " + neural_net.predict([0, 0]).to_s
        puts "[1, 0] -> " + neural_net.predict([1, 0]).to_s
        puts "[0, 1] -> " + neural_net.predict([0, 1]).to_s
        puts "[1, 1] -> " + neural_net.predict([1, 1]).to_s
        puts "done." 
  end
end

require 'rutils/neuralnet/neuralnetwork'