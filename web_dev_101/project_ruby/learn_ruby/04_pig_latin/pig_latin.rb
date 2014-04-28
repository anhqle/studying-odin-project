def translate_one_word(word)
  is_capitalized = word.capitalize == word

  vowels = "aeiou"
  letters_to_flip = ""
  word.split("").each do |letter|
    if vowels.include?(letter)
      if letter != "u"
        break
      elsif word[word.index("u") - 1] != "q"
        break
      end
    end
    letters_to_flip = letters_to_flip + letter
  end

  latinized = (word[letters_to_flip.length..-1] + letters_to_flip + "ay").downcase
  if is_capitalized
    return latinized.capitalize
  else
    return latinized
  end
end

def translate(sentence)
  words = sentence.split(" ")
  result = words.inject("") { |result, word| result + translate_one_word(word) + " "}
  return result.strip!
end

