def stock_picker(array)
  min_to_max = array.sort
  max_to_min = array.sort{|x,y| y <=> x }

  i = 0
  while i < array.size
    min = min_to_max[i]
    max = max_to_min[i]
    if array.index(min) < array.index(max)
      return [array.index(min), array.index(max)]
    else
      min_next = min_to_max[i + 1]
      max_next = max_to_min[i + 1]
      if (max - min_next) > (max_next - min)
        if array.index(min_next) < array.index(max)
          return [array.index(min_next), array.index(max)]
        end
      else
        if array.index(min) < array.index(max_next)
          return [array.index(min), array.index(max_next)]
        end
      end
    end
    i += 1
  end
end

print stock_picker([17,3,6,9,15,8,6,1,10])
