class NeuralNetwork

    attr_accessor :inputs,                   
                  :n_inputs, 
                  :n_hidden,

                  :input_weights, 
                  :hidden_weights, 

                  :hidden_nodes, 
                  :output_nodes, 

                  :output_gradients, 
                  :hidden_gradients,

                  :input_wdt, 
                  :hidden_wdt

    def initialize(settings) 
        # num inputs, hidden nodes, output nodes
        
        self.n_inputs = settings[:inputs]
        self.inputs = Array.new(n_inputs+1)
        self.inputs[-1] = -1
        
        self.n_hidden = settings[:hidden_nodes]
        self.output_nodes = Array.new(settings[:output_nodes])
        self.hidden_nodes = Array.new(n_hidden+1)
        
        initialize_weights
    end

    def initialize_weights
        self.input_weights = Array.new(hidden_nodes.size){Array.new(n_inputs+1)}
        self.hidden_weights = Array.new(output_nodes.size){Array.new(n_hidden+1)}
        
        randomize(input_weights)
        randomize(hidden_weights)
        
        self.input_wdt = Array.new(hidden_nodes.size){Array.new(n_inputs+1){0}}
        self.hidden_wdt = Array.new(output_nodes.size){Array.new(n_hidden+1){0}}
    end

    def node_values(inputs)
        inputs.each_index do |i|
            self.inputs[i] = inputs[i]
        end
        set_nodes(self.inputs, input_weights, hidden_nodes)
        set_nodes(hidden_nodes, hidden_weights, output_nodes)
    end

    def set_nodes(values, matrix, nodes)
        (0...matrix.size).each do |i|
            nodes[i] = sigmoid(values.zip(matrix[i]).map{|v,w| v*w}.reduce(:+))
        end
    end

    def predict(inputs)
        node_values(inputs)
        output_nodes.size == 1 ? output_nodes[0] : output_nodes
    end

    def train(inputs, desired, rate, momentum)
        node_values(inputs)
        backpropogate(desired, rate, momentum)
    end

    def backpropogate(desired, rate, momentum)
        output_gradients = output_error(desired)
        hidden_gradients = hidden_error(output_gradients)
        update(inputs, desired, hidden_gradients, output_gradients, rate, momentum)
    end

    def output_error(desired)
        desired.zip(output_nodes).map{|desired, result| (desired - result) * dsigmoid(result)}
    end

    def hidden_error(output_gradients)
        inverse = Array.new(hidden_nodes.size){Array.new(output_nodes.size)}
        hidden_weights.each_index do |i|
            hidden_weights[i].each_index do |j|
                inverse[j][i] = hidden_weights[i][j];
            end
        end
        
        hidden_nodes.each_with_index.map do |node, i|
            dsigmoid(hidden_nodes[i]) * output_gradients.zip(inverse[i]).map{|error, weight| error*weight}.reduce(:+)
        end
    end

    def update(inputs, desired, hidden_gradients, output_gradients, rate, momentum)
        update_weights(hidden_nodes, 
                        inputs, 
                        input_weights, 
                        hidden_gradients, 
                        rate, 
                        input_wdt, 
                        momentum
                      )
        update_weights(output_nodes, 
                        hidden_nodes, 
                        hidden_weights, 
                        output_gradients, 
                        rate, 
                        hidden_wdt, 
                        momentum
                      )
    end

    def update_weights(nodes, values, inp, gradients, rate, deltas, momentum)
        inp.each_index do |i|
            inp[i].each_index do |j|
                dt = rate * gradients[i] * values[j]
                inp[i][j] += dt + momentum * deltas[i][j]
                deltas[i][j] = dt
            end
        end
    end
    
    def sigmoid(x)
        1.0 / (1 + Math::E**-x)
    end

    def dsigmoid(x)
        sigmoid(x) * (1 - sigmoid(x))
    end
    
    def randomize(arr)
        (0...arr.size).each do |i|
            (0...arr[i].size).each do |j|
                arr[i][j] = (rand(100)).to_f / 100
            end
        end
    end
end
