require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_accessor :board, :next_mover_mark, :prev_move_pos
  
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    possible_moves = []
    board.rows.each_with_index do |square, i|
      if square.empty?
        possible_board = board.dup
        possible_board[i] = next_mover_mark
        possible_moves << possible_board
      end
    end
    possible_moves
  end
end
