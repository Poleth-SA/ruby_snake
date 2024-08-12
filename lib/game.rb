require 'io/console'
class Game
  attr_reader :gameboard, :snake, :food
#intinialize is to create the Snake, the Board and the Food objects
  def initialize(max_x=11, max_y=11)
    @gameboard = Board.new(max_x, max_y)
    @snake = Snake.new(gameboard.width, gameboard.length)
    @food = Food.new(gameboard.width, gameboard.length)
  end

  def print_board
    system('clear')
    puts "Your size is: #{snake.size} |  [Q]uit"
    puts "---------------------------"
    gameboard.board.each do
      |line| puts line.each{|item| item}.join(" ")
    end
  end

  def show
    gameboard.create_board
    @gameboard.board[food.x][food.y] = 'o'
    snake.parts.each do |part|
      @gameboard.board[part.first][part.last] = 'x'
    end
    print_board
  end

#show_message is to draw the message on the board
  def show_message(text)
    gameboard.create_board
    gameboard.print_text(text)
    print_board
  end

#show_start_screen is to draw the start screen
  def show_start_screen
    start = false
    while start == false
      system('clear')
      puts "\n
        .........................................................................................................
        .______.......__....__...______...____....____........._______..__...__.......___.......__..___.._______.
        |..._..\\.....|..|..|..|.|..._..\\..\\...\\../.../......../.......||..\\.|..|...../...\\.....|..|/../.|...____|
        |..|_)..|....|..|..|..|.|..|_)..|..\\...\\/.../........|...(----`|...\\|..|..../..^..\\....|..'../..|..|__...
        |....../.....|..|..|..|.|..._..<....\\_...._/..........\\...\\....|....`..|.../../_\\..\\...|....<...|...__|..
        |..|\\..\\----.|..`--'..|.|..|_)..|.....|..|.........----)...|...|..|\\...|../.._____..\\..|.....\\..|..|____.
        |._|.`._____|.\\______/..|______/......|__|........|_______/....|__|.\\__|./__/.....\\__\\.|__|\\__\\.|_______|
        .........................................................................................................
        ................................................Press [S]tart............................................
      "
      key = GetKey.getkey
      sleep(0.5)
      if key && compare_key(key, 's')
        start = true
      end
    end
  end

#check_snake_position is to check if the snake met one of the postions given above
  def check_snake_position
    check_if_snake_met_wall
    check_if_snake_ate_food
    check_if_snake_ate_itself
  end

#check_if_snake_ate_itself is to check if the snake ate itself, the game will end
  def check_if_snake_ate_itself
    if snake.body.include? snake.head
      raise AteItselfError
    end
  end

#check_if_snake_met_wall is to update the head, if the snake meets the wall
  def check_if_snake_met_wall
    snake.update_head(1,0) if snake.head[1] > gameboard.width-1
    snake.update_head(1, gameboard.width-1) if snake.head[1] < 0
    snake.update_head(0, 0) if snake.head[0]  > gameboard.length-1
    snake.update_head(0, gameboard.length-1) if snake.head[0] < 0
  end

#check_if_snake_ate_food is to check if the snake ate the food, if it does then the side of the snake will increase and recreat a "new" food
  def check_if_snake_ate_food
    if snake.head[0] == food.x && snake.head[1] == food.y
      snake.increase
      @food = Food.new(gameboard.width, gameboard.length)
    end
  end

#start is to start the game
  def start
    show_start_screen
    begin
      tick
    rescue AteItselfError
      show_message("Game over")
    end
  end


#tick is the main method that re-renders the Board and all objects in it, checks position, sets direction each 0.1 second. This value can be changed to increase or decrease the speed of the game
  def tick
    in_game = true
    while in_game
      show
      sleep(0.1)
      if key = GetKey.getkey
        in_game = execute_action(key)
      end
      snake.step
      check_snake_position
    end
    show_message("Game quit")
  end

#execute_action is to execute an action on keypress by given keys;
  def execute_action key
    return false if compare_key(key, 'q')
    snake.turn(key)
  end

#compare_key is to compare the given key and receives one from stdin
  def compare_key(key, char)
    key.chr == char.downcase || key.chr == char.upcase
  end
end