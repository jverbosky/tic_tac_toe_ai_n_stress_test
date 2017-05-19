# class to handle game board
class Board

  # attr_reader :game_board
  attr_accessor :game_board  # use for unit testing

  def initialize(size)
    @game_board = Array.new(size*size) { |i| "" }
  end

  # Method to determine if specfied position is open on @game_board
  def position_open?(position)
    @game_board[position] == ""
  end

  # Method to update position on @game_board with specified player mark (X/O)
  def set_position(position, mark)
    @game_board[position] = mark if position_open?(position)
  end

  # Method that returns an array of @game_board positions occupied by X
  def get_x
    @game_board.each_index.select { |position| @game_board[position] == "X" }
  end

  # Method that returns an array of @game_board positions occupied by X
  def get_o
    @game_board.each_index.select { |position| @game_board[position] == "O" }
  end

  # Method to get count of X positions
  def x_count
    @game_board.count("X")
  end

  # Method to get count of X positions
  def o_count
     @game_board.count("O")
  end

  # Method used in stress test to get current mark
  def get_mark(x_count, o_count)
    x_count > o_count ? "O" : "X"
  end

  # Method used in stress test to get current round
  def get_round(x_count, o_count)
    x_count + o_count + 1
  end

end