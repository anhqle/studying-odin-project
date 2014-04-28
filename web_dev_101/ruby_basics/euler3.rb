# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?
num = 13195

res = []
primes = []
i = 2
while i < num
    i_is_prime = true
    primes.each do |prime|
        i_is_prime = (i % prime == 0) ? false : true
        break if i_is_prime == false
    end

    if i_is_prime
        primes = primes + [i]
        res = (num % i == 0) ? res + [i] : res
    end

    i = i + 1
end

print res