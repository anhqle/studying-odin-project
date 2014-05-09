class Player
  attr_accessor :guessed_char

  def initialize
    @guessed_char = []
  end

  def wrong_char(word)
    @guessed_char.select { |char| not word.answer.include?(char) }.join(", ")
  end

  def win?(word)
    word.answer.split("").all? { |ch| @guessed_char.include?(ch) }
  end
end

class Word
  attr_accessor :answer

  def initialize(word)
    @answer = word
  end

  def current_state(player)
    current = ""
    @answer.split("").each do |char|
      current << char if player.guessed_char.include?(char)
      current << "-" if not (player.guessed_char.include?(char))
    end
    return current
  end
end

class Board
  attr_accessor :counter, :word, :player

  def initialize(player, word)
    @counter = 0
    @word = word
    @player = player
  end

  def print
    puts "Word to be guessed: #{@word.current_state(@player)}"
    puts "Wrong guesses: #{@player.wrong_char(@word)}"
    puts "Turns left: #{10 - @counter}"
  end

end

class Session
  attr_accessor :p, :w, :b

  @@words = File.read("5desk.txt").split().select { 
    |word| word.length >= 5 && word.length <= 12
  }

  def initialize
    @p = Player.new
    @w = Word.new(@@words.sample)
    @b = Board.new(@p, @w)
  end

  def prompt_move
    puts "Enter the letter you want to guess"
    while ch = gets.chomp
      case @p.guessed_char.include? ch
      when true
        puts "Choose something you have not guessed"
      when false
        return ch
      end
    end
  end

  def one_turn
    ch = prompt_move
    @p.guessed_char << ch
    @b.counter += 1

    @b.print
  end

  def start
    puts "Guess this word: #{@w.current_state(@p)}"
    while @b.counter <= 10
      one_turn
      if @p.win?(@w)
        puts "You win!"
        break
      end
      puts "____________________________________________"
    end

    puts "You lose! The answer is #{@w.answer}" if not @p.win?(@w)
  end
end
