#creation of the board
class Board
    attr_reader :length, :width, :board
  
    def initialize(width, length)
      @length = length
      @width = width
      create_board
    end
  
#center is to calculates the center points of the created board
    def center
      [board.length/2, board.first.length/2]
    end
  
#print_text is to print the given text in the middle of the board
    def print_text(text)
      char_center = text.length/2
      i = 0
      text.chars.each do |char|
        board[center.first][center.last - char_center + i] = char
        i+=1
      end
    end
  
#create_board is to create the board and fill it with '.' to show on screen
    def create_board
      @board = Array.new(length){ Array.new(width, '.') }
    end
  
  end