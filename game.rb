class Game 

  def initialize
    @player1 = Player.new("Player1")
    @player2 = Player.new("Player2")
    @current_player = @player1
  end
  
  def start
    while @player1.lives > 0 && @player2.lives > 0
      question = Question.new
      puts "------#{@current_player.name}'s turn------"
      
      puts "#{@current_player.name}: #{question.generate_question}:"
      print ">"
      if gets.chomp.to_i != question.answer
        @current_player.lives -= 1
        puts "Seriously? No!"
      else
        puts "YES! You are correct~!"
      end
      
      if @current_player == @player1
         @current_player = @player2
      else
         @current_player = @player1
      end
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    end
    puts "-----------GAME OVER-----------"
    puts "------Thanks for playing!------"
    puts "#{@current_player.name} wins with a score of #{@current_player.lives}/3" 
  end
end
