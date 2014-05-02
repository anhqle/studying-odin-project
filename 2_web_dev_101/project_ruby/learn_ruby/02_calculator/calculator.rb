def add(num1, num2)
    return num1 + num2
end

def subtract(num1, num2)
    return num1 - num2
end

def sum(array)
    return array.inject(0) {|sum, element| sum + element}
end

def multiply(*numbers)
    return numbers.inject(1) { |prod, element| prod * element }
end

def power(num1, num2)
    return num1 ** num2
end

def factorial(num)
    if num == 0
        return 1
    else
        return (1..num).inject(1) { |prod, element| prod * element }
    end
end
