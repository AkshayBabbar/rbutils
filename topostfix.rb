class ToPostfix

	def initialize() 
		@opstack = []
		@output = []
		temp = ''
		
	def postfix(infix)
		# Try it with ASCII - key codes and mapped values
		OPERATOR_PRECEDENCE = {nil=>0,40=>0,42 =>2, 43=>1, 45=>1,47=>2}
		
		# For each byte
		infix.each_byte do |ch|
			case ch
				when 41
					output.push(temp)
					temp = ''
					loop
					{
						if not opstack.empty?
							x = opstack.pop
							if x == 40 break
							else 
								output.push(x.chr)
							end						
						else
							raise 'Missing "("'
							break
						end
					}
				when 40,42, 43, 45, 47 
					output.push(temp)
					temp = ''
					unless ch == 40
						p = OPERATOR_PRECEDENCE[ch]
						loop{
							if  (p > OPERATOR_PRECEDENCE[opstack.last]) break
							else
								output.push(opstack.pop.chr)
							end
						}
					end
					opstack.push(ch)
				else temp += ch.chr
			end
		end
		opstack.each{|ch| output.push(ch.chr)}
	end
	
	def print()
    output.each { |x| print x, " "}
  end
