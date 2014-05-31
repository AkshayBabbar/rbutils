def primeSieve(n)
  primes = Array.new
  
  #initial setup
  for i in 0..n-2
   primes[i] = i+2
  end

  idx = 0
  while primes[idx]**2 <= primes.last
      t = primes[idx]
      #factor out any multiples
      primes = primes.select { |x| x == t || x%t != 0 }
      idx += 1
  end
  return primes
end

def fib(n)
  x=1
  y=1
  z=0
  while z < n
    z=x+y
    x=y
    y=z
  end
  return z
end

#test for primeSieve
puts primeSieve(20)

#test for fib
puts fib(3)