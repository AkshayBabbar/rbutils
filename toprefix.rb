# Converts an infix expression to a prefix expression

# Allowed operators consist of:
#   +
#   -
#   *
#   /
  
OPERATORS = [:+, :-, :*, :/]
OPERATOR_PRECEDENCE = { 
  :+ => 1, 
  :- => 1, 
  :* => 2, 
  :/ => 2 
}
  
# Default is zero (less than all others)
OPERATOR_PRECEDENCE.default = 0
  
# Other symbols
SYMBOL = {
  :left_parenthesis => :"(",
  :right_parenthesis => :")"
}
  
def initialize()
  @opstack = []   
  @output = []
end

def prefix(infix)
  infix.split.reverse.each do |token|
  symbol = token.to_sym
  
  # Do we want to include the specified symbol in our operator list? 
  if OPERATORS.include?(symbol)
    while @operator_stack.any? && OPERATOR_PRECEDENCE[symbol] <= OPERATOR_PRECEDENCE[@operator_stack.last]
      @output_queue.unshift(@operator_stack.pop)
    end
    @operator_stack << symbol
    
    # If symbol is a left-parenthesis
    elsif symbol == SYMBOL[:left_parenthesis]
      until @operator_stack.empty? || @operator_stack.last == SYMBOL[:right_parenthesis] 
        @output_queue.unshift(@operator_stack.pop)
      end
      @operator_stack.pop if @operator_stack.last == SYMBOL[:right_parenthesis]
   
    # If symbol is a right-parenthesis
    elsif symbol == SYMBOL[:right_parenthesis] @operator_stack << symbol
      else @output_queue.unshift(symbol)
    end
   end
   
   # Push the remaining operators into the output queue
   until @operator_stack.empty?
     @output_queue.unshift(@operator_stack.pop)
   end
end
  
def print()
  output.each { |x| print x, " "}
end
