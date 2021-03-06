require_relative "piece"
require "stepable"

class Knight

  include Stepable

  def symbol
    @symbol = :KN
  end

  protected

  def move_diffs
    possible_moves = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
  end

end