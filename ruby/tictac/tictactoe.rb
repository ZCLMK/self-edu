require_relative 'board'

puts "starting tic-tac-toe..."
players = [ 'X' , 'O' ]
current_player = players[rand(2)]
b = Board.new(current_player)
b.display()

while not b.board_full() and not b.winner()
  b.ask_player_for_move(current_player)
  current_player = b.get_next_turn()
  b.display()
  puts
end

if b.winner()
  puts "Player " + b.get_next_turn() + " wins."
else
  puts "Tie game"
end
puts "Game Over"
