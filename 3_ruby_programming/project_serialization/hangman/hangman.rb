require 'yaml'

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
  attr_reader :answer

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
    while ch = gets.chomp.downcase
      case @p.guessed_char.include?(ch)
      when true
        puts "Choose something you have not guessed"
      when false
        return ch
      end
    end
  end

  def save_game(player, word, board)
    outfile = File.open("./saved/#{Time.now.to_s.split.join("_")}", "w")
    yaml = YAML::dump([player, word, board], outfile)
    outfile.close
  end

  def one_turn
    ch = prompt_move
    case ch == 'save'
    when true
      return 'save'
    when false
      @p.guessed_char << ch
      @b.counter += 1
      @b.print
    end
  end

  def start
    puts "Welcome to Hangman! Guess a letter or type 'save' at any time\n"
    @b.print
    while @b.counter <= 10
      if one_turn == 'save'
        save_game(@p, @w, @b)
        saved = true
        puts "Game saved!"
        break
      end
        
      if @p.win?(@w)
        puts "You win!"
        break
      end
      puts "\n"
    end

    puts "You lose! The answer is #{@w.answer}" if (not @p.win?(@w)) && (not saved)
  end
end

class Game

  def load_game(index)
    fname = Dir.glob(File.join("./saved/", "*"))[index]
    yaml = File.read(fname)
    s = Session.new
    s.p, s.w, s.b = YAML::load(yaml)
    return s
  end

  def list_saved
    Dir.glob(File.join("./saved/", "*")).each_with_index do |fname, i|
      puts "#{i}: #{fname}"
    end
  end

  def start
    puts "Do you want to (1) start new game or (2) load saved game?"
    while input = gets.chomp.to_i
      case input
      when 1
        Session.new.start
        break
      when 2
        list_saved
        puts "Pick the save id you want to load?"
        chosen_id = gets.chomp.to_i
        load_game(chosen_id).start
        break
      else
        puts "You have to choose 1 or 2"
      end
    end
  end
end

