## Tic Tac Toe NxN Ai Stress Test ##

This program is for stress testing the NxN Tic Tac Toe game's unbeatable AI.

For full testing, the following matches should be used:

- **unbeatable player 1** versus **Random player 2**
- **random player 1** versus **unbeatable player 2**
- **unbeatable player 1** versus **unbeatable player 2**

If the unbeatable AI is properly written, it should never lose against the random AI.  Additionally, unbeatable AI versus unbeatable AI should **always** result in a tie.

----------

**Setting Up Tests**

----------

1. Open the **main.rb** file.
2. Comment/uncomment either the "Output Board for Final Round" section or the "Output Board for All Rounds" section.  It is recommended to run "Output Board for Final Round" first.
3. Adjust the **size** variable as desired (3 = 3x3, 4 = 4x4, etc.).  For example:

	size = 5  

4. Comment/uncomment the desired **p1_type**, **p1**, **p2_type** and **p2** variables.  For example:

	p1_type = "Unbeatable"  
	p1 = PlayerUnbeatable.new(size, wins)
	
	p2_type = "Random"  
	p2 = PlayerRandom.new(size)

5. Save and close the **main.rb** file.

----------

**Running the Stress Test**

----------

1. Open the **stress\_test.rb** file.
2. Adjust the number in line 8 to run the game the desired amount of times.  For example, to run the test 10,000 times (the default), use this:

	10_000.times { load 'main.rb' }

3. Save and close the **stress\_test.rb** file.
4. Navigate to the directory that contains **stress\_test.rb** in a terminal (command prompt) session.
5. Run the following command:

	ruby stress_test.rb

6. Once the stress test has completed, a **stress\_test.txt** file will be written to the directory that contains **stress\_test.rb**.  Note that running the stress test can take several seconds to complete, depending on the number of games and the size of the board.

----------

**Analyzing Stress Test Results**

----------

1. Open the **stress\_test.txt** file in a text editor that supports a "find all" function (such as Notepad++).
2. Perform a "find all" using the following search terms:

	- player 1
	- player 2
	- tie  

3. When playing the random AI, if the unbeatable AI is working properly, it will win the majority of the time, occasionally tie and never lose.  For example:

	- Unbeatable player 1 wins:  95,952
	- Unbeatable player 1 ties:     408
	- Random player 2 wins:           0

----------
