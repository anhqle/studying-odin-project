def bubble_sort(array)
  for i in (0...array.size)
    # After each iteration of i, we know that the i last elements are sorted
    # So we only have to iterate j up to array.size - i - 1
    # This means that we do not have to check the last i elements
    for j in (0...(array.size - i - 1))
      if array[j] > array[j + 1]
        array[j], array[j + 1] = array[j + 1], array[j]
      end
    end
  end
  return array
end

print bubble_sort([4,3,78,2,0,2]).to_s + "\n"

def bubble_sort_by(array)
  for i in (0...array.size)
    for j in (0...(array.size - i - 1))
      # The conditional takes a block with the spaceship operator
      # It's effectively testing whether array[j] > array[j + 1] as above
      if yield(array[j], array[j + 1]) < 0
        array[j], array[j + 1] = array[j + 1], array[j]
      end
    end
  end
  return array
end

a = bubble_sort_by(["hi", "hello", "hey"]) do |left, right|
  right.length - left.length
end

puts a.to_s + "\n"