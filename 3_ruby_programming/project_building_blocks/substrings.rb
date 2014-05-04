dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dictionary)
  words = {}
  for i in (0..(string.size - 1))
    for j in (i..(string.size - 1))
      substring = string[i..j]
      if dictionary.include?(substring)
        words[substring] = words.fetch(substring, 0) + 1
      end
    end
  end
  return words
end

print substrings("below", dictionary)