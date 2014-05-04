def caesar_cipher(text, num)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  transformed_text = ""
  text.split("").each do |char|
    if "?.,! ".include?(char)
      transformed_text << char
    else
      transformed_char = alphabet[(alphabet.index(char.downcase) + num) % alphabet.size]
      if char == char.upcase
        transformed_text << transformed_char.upcase
      else
        transformed_text << transformed_char
      end
    end
  end
  return transformed_text.strip
end

print caesar_cipher("What a string!", 5)