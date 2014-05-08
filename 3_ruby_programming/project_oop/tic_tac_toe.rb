class Player
  attr_accessor :symbol, :moves

  def initialize(symbol)
    @symbol = symbol
    @moves = Hash[ (1..9).map { |num| [num, nil] } ]
  end

  def make_move(game_board, position)
    game_board.modify(position, @symbol)
  end
end

class GameBoard
  attr_accessor :board

  def initialize
    @board = Hash[ (1..9).map { |num| [num, "0"] } ]
  end

  def print
    puts (1..3).inject("") { |line, num| line + @board[num] + " | " }
    puts (4..6).inject("") { |line, num| line + @board[num] + " | " }
    puts (7..9).inject("") { |line, num| line + @board[num] + " | " }
  end

  def modify(position, player)
    @board[position] = player
  end
end

p1 = Player.new("x")
p2 = Player.new("o")
b = GameBoard.new
