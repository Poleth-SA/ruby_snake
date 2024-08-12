*The following code is on Ruby to code a snake game. the code purposely has several notes to explain each section. This project is just to selfusage to practice*

Whats in the Gemfile?
1. The Gemfile contains a few gems: RSpec for tests and Pry for debugging our application. Gemfile

The board section of the game consist of the following files
1. board_spec.rb: This file contains the tests for the Board class.
2. board.rb: This file contains the implementation of the Board class.
little notes: the board is 9x9 grid, with each cell containing a number from 1 to 9. 

The snake the game consist of the following files
1. snake_spec.rib: This file contains the test for the Snake
2. snake.rb: This files contains the implementation of the Snake

The food section of the game consist of the following files
1. food_spec.rb: This file contains the test for the food
2. food.rb: A small file that contains the implementation of the snake's food

The folder called erros is used to create different erros for any cases to avoid the game to glitch or not work correctly.
1. ate_itself_error.rb: is activated when the snake "eats" themselves or hit the wall

The game mechanics
1. game_spec.rb: a list of requirements
2. game.rb: This file contains the main logic and mechanics of the snake game, including how the game starts, progresses, and ends.

get_key.rb
1. module from this answer http://stackoverflow.com/questions/946738/detect-key-press-non-blocking-w-o-getc-gets-in-ruby which is used to getting keypress without waiting for it

start.rb
1. is the file we will be running to be able to play the game. Run it  on the terminal

**screenshots of the game**