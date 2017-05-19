# class to handle win and endgame items
class Win

  # @game_board is initially populated by Game class for populating @wins
  attr_accessor :game_board
  # @wins and @win need to be available to the Game class
  attr_reader :wins, :win
  # attr_reader :wins, :win, :size  # use for unit testing

  def initialize(size)
    @size = size  # board size populated by user input from Game class
    @game_board = []  # populated with current game board by game_over? in Game class
    @wins = []  # populated with all winning positions by populate_wins()
    @win = []  # populated with game-winning positions by get_win()
  end

  # Method get the current game board for endgame evaluations
  def update_board(board)
    @game_board = board
  end

  # Method to determine if the game board is full (endgame condition)
  def board_full?
    @game_board.count("") == 0
  end

  # Method to convert game_board into an array of indexes
  def get_board_indexes
    board_indexes = @game_board.each_index.select { |position| game_board[position] }
  end

  # Method to calculate horizontal winning positions
  def get_h_wins(board_indexes)
    h_wins = board_indexes.each_slice(@size).to_a
  end

  # Method to calculate vertical winning positions
  def get_v_wins(board_indexes)
    v_wins = []
    array_counter = 0
    offset_counter = 0
    @size.times {
      single_v_win = []
      @size.times {
        single_v_win.push(board_indexes[offset_counter])
        offset_counter += @size
      }
      v_wins.push(single_v_win)
      offset_counter -= board_indexes.count - 1
      array_counter += 1
    }
    v_wins
  end  

  # Method to calculate top-left diagonal winning positions
  def get_d_1_win
    d_win_1 = []
    dw1_position = 0
    dw1_offset = @size + 1
    @size.times {
      d_win_1.push(dw1_position)
      dw1_position += dw1_offset
    }
    d_win_1
  end

  # Method to calculate top-right diagonal winning positions
  def get_d_2_win
    d_win_2 = []
    dw2_position = @size - 1
    dw2_offset = @size - 1
    @size.times {
      d_win_2.push(dw2_position)
      dw2_position += dw2_offset
    }
    d_win_2
  end

  # Method to compile diagonal winning positions
  def get_d_wins
    d_wins = []
    d_wins.push(get_d_1_win, get_d_2_win)
    d_wins
  end

  # Method to populate @wins with all winning positions based on board size
  def populate_wins
    b_idx = get_board_indexes
    @wins = get_h_wins(b_idx) + get_v_wins(b_idx) + get_d_wins
  end

  # Method to update @win with the winning positions and return true if player won
  def get_win(positions)
    won = false
    @wins.each { |win| (won = true; @win = win) if positions & win == win }
    won
  end

  # Method to determine if X won (endgame position)
  def x_won?
    x = @game_board.each_index.select { |position| @game_board[position] == "X" }
    get_win(x)
  end

  # Method to determine if O Won (endgame condition)
  def o_won?
    o = @game_board.each_index.select { |position| @game_board[position] == "O" }
    get_win(o)
  end

end