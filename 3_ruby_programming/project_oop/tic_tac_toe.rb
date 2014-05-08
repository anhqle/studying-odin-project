class Player
  attr_accessor :symbol, :moves

  @@win_condition = [ [1,2,3], [4,5,6], [7,8,9],
                      [1,4,7], [2,5,8], [4,6,9],
                      [1,5,9], [3,5,7] ]
 
  def initialize(symbol)
    @symbol = symbol
    @moves = Hash[ (1..9).map { |num| [num, nil] } ]
  end

  def make_move(game_board, position)
    game_board.modify(position, @symbol)
    @moves[position] = true
  end

  def win?
    return @@win_condition.include? @moves.keys.select { |key| @moves[key].nil? == false }
  end
end

class Board
  attr_accessor :board

  def initialize
    @board = Hash[ (1..9).map { |num| [num, "."] } ]
  end

  def print
    puts (1..3).inject("") { |line, num| line + @board[num] + " | " }
    puts (4..6).inject("") { |line, num| line + @board[num] + " | " }
    puts (7..9).inject("") { |line, num| line + @board[num] + " | " }
  end
 
  def modify(position, player)
    @board[position] = player
  end

  def available_cell
    return @board.keys.select { |key| @board[key] == "." }
  end
end

class Session

  def initialize
    @p1 = Player.new("x")
    @p2 = Player.new("o")
    @b = Board.new
  end

  def start
    until @p1.win? || @p2.win? || draw?
      one_more_turn(@p1, "Player 1")
      unless @p1.win? || draw?
        one_more_turn(@p2, "Player 2")
      end
    end

    if draw?
      puts "You both suck"
    else
      @winner = @p1.win? ? "Player 1" : "Player 2"
      puts "#{@winner} wins!"
    end
  end

  private
    def draw?
      return (not @b.board.values.include?(".")) && (not @p1.win?) && (not @p2.win?)
    end

    def prompt_move(player, player_name)
      puts "#{player_name} enter your move"
      while m = gets.chomp.to_i
        case @b.available_cell.include?(m)
        when true
          return m
        when false
          puts "Make sure to choose only available cell"
        end
      end
    end

    def one_more_turn(player, player_name)
      m = prompt_move(player, player_name)
      player.make_move(@b, m)
      @b.print
    end  
end