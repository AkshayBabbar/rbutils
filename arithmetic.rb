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

#test for primeSieve
puts primeSieve(20)