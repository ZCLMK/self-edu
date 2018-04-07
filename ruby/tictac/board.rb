class Board

    BOARD_MAX_INDEX = 2
    EMPTY_POS = ' '

      def initialize(current_player)
        @current_player = current_player
        @board = Array.new(BOARD_MAX_INDEX + 1){
          Array.new(BOARD_MAX_INDEX + 1){EMPTY_POS}
        }
      end

      def display

        puts "+- - - - - -+"
        for row in 0..BOARD_MAX_INDEX
          print "| "
          for col in 0..BOARD_MAX_INDEX
            s = @board[row][col]
            if s == EMPTY_POS
              print col + (3 * row) + 1
            else
              print s
            end
            print " | "
          end
          puts "\n+- - - - - -+"
        end
      end

      def board_full()
        for row in 0..BOARD_MAX_INDEX
          for col in 0..BOARD_MAX_INDEX
            if @board[row][col] == EMPTY_POS
              return false
            end
          end
        end
        return true
      end

# ask player for move

def ask_player_for_move(current_player)
  played = false

  while not played
    puts "Player " + current_player + ":where would you like to play?"
    move = gets.to_i - 1
    col = move % @board.size
    row = (move - col) / @board.size
    if validate_position(row, col)
      # can this be written the other way around?
      @board[row][col] = current_player
      played = true
    end
  end
end

def validate_position(row, col)
  if row <= @board.size and col <= @board.size
      if @board[row][col] == EMPTY_POS
        return true
      else
        puts "That position is occupied"
      end
    else
      puts "invalid position"
  end
  return false
end

def get_next_turn
  if @current_player == 'X'
    @current_player = 'O'
  else
    @current_player = 'X'
  end
  return @current_player
end


# Winner helper methods
      def winner_rows
        for row_index in 0..BOARD_MAX_INDEX
          first_symbol = @board[row_index][0]
          for col_index in 1..BOARD_MAX_INDEX
            if @board[row_index][col_index] != first_symbol
              break
            elsif col_index == BOARD_MAX_INDEX and first_symbol != EMPTY_POS
              return first_symbol
            end
          end
        end
        return
      end

      def winner_cols
        for col_index in 0..BOARD_MAX_INDEX
          first_symbol = @board[0][col_index]
          for row_index in 1..BOARD_MAX_INDEX
            if @board[row_index][col_index] != first_symbol
              break
            elsif row_index == BOARD_MAX_INDEX and first_symbol != EMPTY_POS
              return first_symbol
            end
          end
        end
        return
      end

      def winner_diagonals
        # diagonal vers bas-droite
          first_symbol = @board[0][0]
        for inner_index in 1..BOARD_MAX_INDEX
          if first_symbol != @board[inner_index][inner_index]
            break
          elsif inner_index == BOARD_MAX_INDEX and first_symbol != EMPTY_POS
            return first_symbol
          end
        end
        # diagonale vers haut droite
        first_symbol = @board[0][BOARD_MAX_INDEX]
        row_index = 0
        col_index = BOARD_MAX_INDEX

        while row_index < BOARD_MAX_INDEX
          row_index += 1
          col_index -= 1
          if @board[row_index][col_index] != first_symbol
            break
          elsif row_index == BOARD_MAX_INDEX && first_symbol != EMPTY_POS
            flag = true
          end
        end
        if flag == true
          return first_symbol
        end
      end

# Winner
  def winner
        winner = winner_rows()
        if winner
          return winner
        end

        winner = winner_cols()
        if winner
          return winner
        end

        winner = winner_diagonals()
        if winner
          return winner
        end
        return
  end
end
  #fixbug :  la deuixieme diagonale ne permet pas de
