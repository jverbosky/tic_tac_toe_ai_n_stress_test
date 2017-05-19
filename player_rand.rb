require_relative "board.rb"

# class for computer player that randomly places mark
class PlayerRandom

  # attr_accessor :moves  # use for unit testing

  def initialize(size)
    @moves = [*0..(size*size)-1]  # board positions
  end

  # Method to return random open position
  def get_move(game_board)
    # create an array of indexes for the open positions
    position = game_board.each_index.select{ |index| game_board[index] == "" }
    # get a location from @moves using a random index
    move = @moves[position.sample]
  end

end

# Sandbox testing

# board = Board.new(3)
# board.game_board = ["X", "O", "X", "O", "X", "O", "O", "", ""]
# rand = PlayerRandom.new
# p rand.get_move(board.game_board)