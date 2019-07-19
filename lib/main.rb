require_relative "game_board"
require_relative "player"

def clear_screen
    puts `clear`
end 

clear_screen
puts "Player 1, type your name.".center(120)
player1 = Player.new(gets.chomp,"X")
puts "Player 2, type your name.".center(120)
player2 = Player.new(gets.chomp,"O")

game_board = GameBoard.new(player1, player2)

loop do
    clear_screen
    puts game_board.display.lines.map!{|line| line.strip.center(120)}.join("\n")
    break if game_board.winner? || game_board.tie?
    puts "#{player1.name}, whats your move?"
    game_board.drop_piece(Player.move, player1.character)
    clear_screen
    puts game_board.display.lines.map!{|line| line.strip.center(120)}.join("\n")
    break if game_board.winner? || game_board.tie?
    puts "#{player2.name}, whats your move?"
    game_board.drop_piece(Player.move, player2.character)
end

puts "GAME OVER".center(120)

if game_board.winners_name
    puts "#{game_board.winners_name} won!".center(120)
elsif game_board.tie?
    puts "It was a tie".center(120)
end