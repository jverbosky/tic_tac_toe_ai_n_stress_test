# Output Board for Final Round #

# Stress testing code that only displays final game screen (just for reference)
# Loops until game over condition reached - use for stress testing

# require_relative "board.rb"
# require_relative "win.rb"
# require_relative "player_rand.rb"
# require_relative "player_unb.rb"
# require_relative "console_stress_test.rb"

# # Board size (size x size)
# size = 3

# # Initialize objects
# board = Board.new(size)
# win = Win.new(size)

# win.game_board = board.game_board  # populate Win board for calculating wins
# win.populate_wins  # populate wins array in Win class
# wins = win.wins

# p1_type = "Random"
# p1 = PlayerRandom.new(size)
# # p1_type = "Unbeatable"
# # p1 = PlayerUnbeatable.new(size, wins)  # alternate p1

# # p2_type = "Random"
# # p2 = PlayerRandom.new(size)
# p2_type = "Unbeatable"
# p2 = PlayerUnbeatable.new(size, wins)  # alternate p2

# console = ConsoleStressTest.new(size)

# # Endgame condition checks - default to false
# x_won = false
# o_won = false
# full = false

# # Each iteration == 1 (attempted) move
# while x_won == false && o_won == false && full == false
#   round = board.get_round(board.x_count, board.o_count)  # puts round  # see the current round number
#   round % 2 == 0 ? player = p2 : player = p1  # puts player  # see which player moved during this turn
#   round % 2 == 0 ? p_type = p2_type : p_type = p1_type  # puts player  # see which player moved during this turn
#   mark = board.get_mark(board.x_count, board.o_count)  # puts mark  # see which mark was used
#   x_pos = board.get_x
#   o_pos = board.get_o
#   if p_type == "Unbeatable"
#     move = player.get_move(x_pos, o_pos, mark)  # use for PerfectPlayer3
#   else
#     move = player.get_move(board.game_board)  # use for PerfectPlayer3
#   end
#   board.set_position(move, mark)
#   x_won = win.x_won?  # puts x_won  # see if x won (t/f)
#   o_won = win.o_won?  # puts o_won  # see if o won (t/f)
#   full = win.board_full?  # puts full # see if the game_board is full (t/f)
# end

# # Console output for game results (board and status)
# console.output_board(board.game_board)
# console.output_results(x_won, o_won)

#-----------------------------------------------------------------------

# Output Board for All Rounds #

# Stress testing code that displays game screen for every round
# to determine where logic fails
# Loops until game over condition reached

require_relative "board.rb"
require_relative "win.rb"
require_relative "player_rand.rb"
require_relative "player_unb.rb"
require_relative "console_stress_test.rb"

# Board size (size x size)
size = 5

# Initialize objects
board = Board.new(size)
win = Win.new(size)

win.game_board = board.game_board  # populate Win board for calculating wins
win.populate_wins  # populate wins array in Win class
wins = win.wins

# p1_type = "Random"
# p1 = PlayerRandom.new(size)
p1_type = "Unbeatable"
p1 = PlayerUnbeatable.new(size, wins)  # alternate p1

p2_type = "Random"
p2 = PlayerRandom.new(size)
# p2_type = "Unbeatable"
# p2 = PlayerUnbeatable.new(size, wins)  # alternate p2

console = ConsoleStressTest.new(size)

# Endgame condition checks - default to false
x_won = false
o_won = false
full = false

# Method to allow console output to be specified more concisely
def tab(n, *string)
  string.each_with_index { |e, i| i == 0 ? (puts " " * n + e) : (puts e) }
end

# Each iteration == 1 (attempted) move
while x_won == false && o_won == false && full == false
  round = board.get_round(board.x_count, board.o_count)  # puts round  # see the current round number
  round % 2 == 0 ? player = p2 : player = p1  # puts player  # see which player moved during this turn
  round % 2 == 0 ? p_type = p2_type : p_type = p1_type  # puts player  # see which player moved during this turn
  mark = board.get_mark(board.x_count, board.o_count)  # puts mark  # see which mark was used
  x_pos = board.get_x
  o_pos = board.get_o
  if p_type == "Unbeatable"
    move = player.get_move(x_pos, o_pos, mark)  # use for PerfectPlayer3
  else
    move = player.get_move(board.game_board)  # use for PerfectPlayer3
  end
  board.set_position(move, mark)
  x_won = win.x_won?  # puts x_won  # see if x won (t/f)
  o_won = win.o_won?  # puts o_won  # see if o won (t/f)
  full = win.board_full?  # puts full # see if the game_board is full (t/f)
  puts "\n"
  spaced = []
  board.game_board.each { |mark| mark == "" ? spaced.push(" ") : spaced.push(mark) }
  rows = spaced.each_slice(size).to_a
  rows.each_with_index do |row, index|
    index < (size - 1) ? (tab(0, row.join(" | ")); tab(0, "-" * (size * 4))) : tab(0, row.join(" | "))
  end
  puts "\n"
end

# Console output for game results (board and status)
console.output_results(x_won, o_won)