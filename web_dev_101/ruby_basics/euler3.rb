# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?
num = 1032

res = Array.new
primes = Array.new
i = 1
while i < num
    i_is_prime = true
    primes.each do |prime|
        i_is_prime = (i % prime == 0) ? false : true
    end

    if i_is_prime
        res = (num % i == 0) ? res + [i] : res
    end

    i = i + 1
end

print res