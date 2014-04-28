class Book
  attr_accessor :title

  def title
    cap_exception = ["the", "a", "an", "and", "in", "of"]
    cap_always = ["i"] # Not really needed
    words = @title.split(" ")

    processed_words = []

    words[1..-1].each do |word|
      if cap_exception.include?(word)
        processed_words << [word]
      else
        processed_words << [word.capitalize]
      end
    end

    processed_words.unshift(words[0].capitalize)
    return processed_words.join(" ")
  end
end