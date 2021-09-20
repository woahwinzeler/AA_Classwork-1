require_relative 'tic_tac_toe'
require_relative '00_tree_node'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @root_node = PolyTreeNode.new(board)
    @next_mover_mark = next_mover_mark
    @prev_mov_pos = prev_mov_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children

  end
end
