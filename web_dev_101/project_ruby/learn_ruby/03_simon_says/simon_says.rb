def echo(word)
    return word
end

def shout(word)
    return word.upcase
end

def repeat(word, num=2)
    return ((word + " ") * num).strip!
end

def start_of_word(word, num)
    return word[0..(num-1)]
end

def first_word(sentence)
    return sentence.split(" ")[0]
end

def titleize(sentence)
    little_words = ["and", "the", "over"]
    words = sentence.split(" ")
    words.each do |word|
        if (words.index(word) == 0) || (not little_words.include?(word))
            word.capitalize!
        end
    end
    return words.join(" ")
end