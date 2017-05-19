# Script to capture repeated terminal output from tic tac toe program for stress testing and bug checking

require 'stringio'

stdout = StringIO.new
$stdout = stdout

10_000.times { load 'main.rb' }
File.open("stress_test.txt", 'w') { |file| file.write(stdout.string) }