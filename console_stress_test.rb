# class to outputting final game board and results to terminal
class ConsoleStressTest

  def initialize(size)
    @size = size
    puts "-" * 11
    puts "Tic Tac Toe"
    puts "-" * 11
  end

  def output_board(board)
    board.map! { |mark| mark == "" ? " " : mark }
    rows = board.each_slice(@size).to_a
    rows.each { |row|  print "  " + row.join(" ") + "\n" }
  end

  def output_results(x_won, o_won)
    puts "-" * 11
    if x_won == true
      puts "Player 1 (X) won!"
    elsif o_won == true
      puts "Player 2 (O) won!"
    else
      puts "It was a tie!"
    end
    puts "-" * 11
    puts "\n"
  end

end