class Game

  def initialize
    @grid = Array.new(3) {Array.new(3)}
  end

  def display
    puts @grid.map {|x| x.to_s }.join("\n")
  end

  def status
    output = false
    diagonal1 = [ @grid[0][0], @grid[1][1], @grid[2][2] ]
    diagonal2 = [ @grid[0][2], @grid[1][1], @grid[2][0] ] 
    #p diagonal1
    for i in 0..2 do
      if @grid[i].all? { |e| e == 'O' } || @grid[i].all? { |e| e == 'X' }
        output = true
      elsif @grid.map{|a| a[i]}.all? {|e| e == 'O'} || @grid.map{|a| a[i]}.all? {|e| e == 'X'}
        output = true
      end
    end

    if diagonal1.all? { |e| e == 'O' } || diagonal1.all? { |e| e== 'X' }     #checks diagonal 
      output = true
    elsif diagonal2.all? { |e| e == 'O' } || diagonal2.all? { |e| e== 'X' }
      output = true
    end

    output

  end

  def play
    row = 0
    column = 0
    turn_count = 0

    marker = 'O'  #intial value
    display()
    while(!status())
      turn_count += 1

      puts "Which row?"
      row = gets.to_i - 1
      puts "Which column"
      column = gets.to_i - 1
      puts

      if marker == "O"
        marker = 'X' 
      else
        marker = 'O'
      end

      if @grid[row][column].nil?           #only allow to mark when space is empty
        @grid[row][column] = marker 
      else
        puts "This space is already taken"
        next
      end

      display()

      if turn_count == 9
        puts "It's a tie!"
        break
      end

    end
    puts marker + " player won" if turn_count != 9
  end

end

newGame = Game.new
newGame.play