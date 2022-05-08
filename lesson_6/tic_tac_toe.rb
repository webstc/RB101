require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_first_player!(brd, ans)
  if ans.downcase.start_with?('c')
    brd[:current_player] = "Computer"
  elsif ans.downcase.start_with?('p')
    brd[:current_player] = "Player"
  end
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd)
  system 'clear'
  puts "TIC TAC TOE -- BEST OF 5"
  puts ""
  puts " ~~~ ROUND #{brd[:round]} ~~~"
  puts ""
  puts "You're '#{PLAYER_MARKER}'.  Computer is '#{COMPUTER_MARKER}'."
  puts "The first one to win 5 games is the CHAMPION!!"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
  puts "~~~~~SCOREBOARD~~~~~~"
  puts "PLAYER: #{brd[:player]} wins"
  puts "COMPUTER: #{brd[:computer]} wins"
  puts "~~~~~~~~~~~~~~~~~~~~~"
  puts ""
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def initialize_board!(brd)
  (1..9).each { |num| brd[num] = INITIAL_MARKER }
  brd[:round] += 1
  brd
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, div = ', ', prep = 'or')
  last = arr.pop
  if arr.size == 0
    last.to_s
  elsif arr.size == 1
    arr.join + " " + prep + " " + last.to_s
  else
    arr.join(div) + div + prep + " " + last.to_s
  end
end

def player_places_piece!(brd)
  sq = ''
  loop do
    prompt "Choose a square #{joinor(empty_squares(brd))}"
    sq = gets.chomp.to_i
    break if brd.keys.select { |num| brd[num] == INITIAL_MARKER }.include?(sq)
    prompt "Sorry, that's not a valid choice"
  end
  brd[sq] = PLAYER_MARKER
end

def find_square_at_risk(brd, plyr)
  sq = nil
  target_line = WINNING_LINES.select do |line|
    brd.values_at(*line).count(plyr) == 2 &&
      brd.values_at(*line).count(INITIAL_MARKER) == 1
  end.flatten
  if target_line.size != 0 # if there is an open space
    sq = target_line.select do |key|
      brd[key] == INITIAL_MARKER
    end[0]
  end
  sq
end

def computer_places_piece!(brd)
  if find_square_at_risk(brd, COMPUTER_MARKER)
    square = find_square_at_risk(brd, COMPUTER_MARKER)
  elsif find_square_at_risk(brd, PLAYER_MARKER)
    square = find_square_at_risk(brd, PLAYER_MARKER)
  elsif brd[5] == INITIAL_MARKER
    square = 5
  else
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd)
  if brd[:current_player] == "Computer"
    computer_places_piece!(brd)
  elsif brd[:current_player] == "Player"
    player_places_piece!(brd)
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def tally_winner(brd)
  brd[:"#{detect_winner(brd).downcase}"] += 1
end

def won_five?(brd)
  brd[:"#{detect_winner(brd).downcase}"] == 5
end

def display_champ(brd)
  prompt "#{detect_winner(brd).upcase} won 5 games and is the:"
  prompt ""
  prompt "~ ~ ~ ~ ~ CHAMPION ~ ~ ~ ~ ~"
end

def alternate_player(brd)
  if brd[:current_player] == "Computer"
    brd[:current_player] = "Player"
  elsif brd[:current_player] == "Player"
    brd[:current_player] = "Computer"
  end
end

loop do
  board = { player: 0, computer: 0, round: 0 }
  system 'clear'

  loop do # set who gets first move
    prompt "Who would you like to go first?"
    prompt "'c' for Computer, or 'p' for Player"
    answer = gets.chomp
    initialize_first_player!(board, answer) # set current player
    break if answer.downcase.start_with?('p') || answer.downcase.start_with?('c')
    prompt "INVALID CHOICE -- please try again"
  end

  loop do # main loop
    board = initialize_board!(board)
    loop do
      display_board(board)
      place_piece!(board)
      alternate_player(board)
      break if someone_won?(board) || board_full?(board)
    end
    if someone_won?(board)
      tally_winner(board)
    end
    display_board(board)
    if detect_winner(board) && won_five?(board)
      display_champ(board)
      break
    end
    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
    else
      prompt "It's a tie!"
    end
    prompt "Are you ready for the next round?"
    prompt "Press RETURN to continue; 'q' to quit."
    answer = gets.chomp
    break if answer.downcase.start_with?('q')
  end
  prompt ""
  prompt "Would you like to play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt "Thanks for playing!"
prompt "Good-bye!"
