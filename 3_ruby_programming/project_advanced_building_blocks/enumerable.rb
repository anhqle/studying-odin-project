module Enumerable
  def my_each
    for i in (0...self.size)
      yield(self[i])
    end
    return self
  end

  def my_each_with_index
    for i in (0...self.size)
      yield(self[i], i)
    end
  end

  def my_select
    result = []
    self.my_each do |element|
      result << element if yield(element) == true
    end
    return result
  end

  def my_all?
    all_satisfied = true
    self.my_each do |element|
      all_satisfied = false if yield(element) == false
    end
    return all_satisfied
  end

  def my_any?
    any_satisfied = false
    self.my_each do |element|
      any_satisfied = true if yield(element) == true
    end
    return any_satisfied
  end

  def my_none?
    return self.my_all? == false
  end

  def my_count(*args)
    count = 0
    self.my_each do |element|
      if block_given?
        count += 1 if yield(element) == true
      elsif args.empty? == true
        count += 1
      else
        count += 1 if element == args.first
      end 
    end
    return count
  end

  def my_map
    result = []
    self.my_each do |element|
      result << yield(element)
    end
    return result
  end

  def my_inject(*args)
    result = args.empty? ? self.first : args.first
    start_index = args.empty? ? 1 : 0
    self[start_index...self.size].my_each do |element|
      result = yield(result, element)
    end
    return result
  end

  def my_map_proc(&proc)
    result = []
    self.my_each do |element|
      result << proc.call(element)
    end
    return result
  end

  # I don't understand this part???
  def my_map_both(&proc)
    result = []
    if block_given?
      self.my_map_proc(&proc).my_each do |element|
        result << yield(element)
      end
    else
      result = self.my_map_proc(&proc)
    end
    return result
  end
end

def multiply_els(array)
    return array.my_inject(1) { |res, el| res * el }
end

# Test
print [1,2,5,4,8].my_select { |ob| ob % 2 == 0} == [2,4,8]
print [1,2,5,4,8].my_count { |ob| ob % 2 == 0} == 3
print [1,2,5,4,8].my_count == 5
print [1,2,5,4,8].my_count(4) == 1
print [1,2,5,4,8].my_map { |ob| ob * 2 } == [2,4,10,8,16]

my_proc = Proc.new { |ob| ob * 2 }
print [1,2,5,4,8].my_map_proc(&my_proc) == [2,4,10,8,16]

print [1,2,5,4,8].my_inject { |res, ele| res + ele } == 20
print multiply_els([2,4,5]) == 40

halve_proc = Proc.new { |ob| ob / 2.0 }
print [1,2,5,4,8].my_map_both(&halve_proc)
print [1,2,5,4,8].my_map_both(&halve_proc) { |ob| ob * 2 }