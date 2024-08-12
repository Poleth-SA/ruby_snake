The following code is on Ruby to code a snake game. the code purposely has several notes to explain each section. This project is just to selfusage to practice

Whats in the Gemfile?
1. The Gemfile contains a few gems: RSpec for tests and Pry for debugging our application. Gemfile

The board section of the game consist of the following files
1. board_spec.rb: This file contains the tests for the Board class.
2. board.rb: This file contains the implementation of the Board class.
little notes: the board is 9x9 grid, with each cell containing a number from 1 to 9. The board is divided into 9 3x3 subgrids, each containing numbers from 1 to 9. The goal of the game is to fill the board with numbers from 1 to 9 such that each row, column, and subgrid contains each number exactly once.

The snake the game consist of the following files
1. snake_spec.rib: This file contains the test for the Snake
2. snake.rb: This files contains the implementation of the Snake
