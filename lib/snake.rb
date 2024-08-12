class Snake
    attr_reader :size, :direction, :position, :parts
#initialize is to create parameters for the snake, sets the positions and creates the snake.
    def initialize(max_x, max_y)
      @size = 4
      @direction = :left
      @parts = []
      set_start_position(max_x, max_y)
      create_snake
    end
  
#create_snake is to create the snake using size varibles to define the legnth
    def create_snake
      size.times do |iteration|
        @parts &lt;&lt; [position[0], position[1]+iteration]
      end
    end
  
#head is to return the first part of the snake
    def head
      parts.first
    end
  
#body returns all the parts behind the head
    def body
      parts[1..parts.length-1]
    end
  
#set_start_position is to set a random position for the snake to start
    def set_start_position(max_x, max_y)
      @position = [Random.rand(0..max_x-1), Random.rand(0..max_y-1)]
    end
  
    def increase
      @size += 1
      @parts &lt;&lt; parts.last
    end
  
#update_head is updates the head of the snake if the snake hits the wall
    def update_head(idx, value)
      @parts.first[idx] = value
    end
  
#turn is to change the direction of the snake and the keys to do so
    def turn(key_code)
      @direction = case key_code.chr
      when 'w' || 'W'
        :up
      when 's' || 'S'
        :down
      when 'a' || 'A'
        :left
      when 'd' || 'D'
        :right
      else
        direction
      end
    end
  
#step is to move the snake's each interation
    def step
      new_head = [head.first,head.last]
      case direction
      when :left
        new_head[1] -= 1
      when :right
        new_head[1] += 1
      when :up
        new_head[0] -= 1
      when :down
        new_head[0] += 1
      end
      parts.unshift(new_head)
      parts.pop
    end
  end