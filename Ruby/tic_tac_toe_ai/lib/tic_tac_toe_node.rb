require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)

    if board.over?
      return board.won? && board.winner != evaluator
    end
    
    if self.next_mover_mark == evaluator
      self.children.all? {|child| child.losing_node?(evaluator)}
    else
      self.children.any? {|child| child.losing_node?(evaluator)}
    end
    
  end

  def winning_node?(evaluator)
    if board.over?
      return board.winner == evaluator   
    end

    if self.next_mover_mark == evaluator
      self.children.any? {|child| child.winning_node?(evaluator)}
    else
      self.children.all? {|child| child.winning_node?(evaluator)}
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []
    @board.rows.each.with_index do |arr, row|
      arr.each.with_index do |ele, col|
        pos = [row, col]
        if @board.empty?(pos)
          duped = @board.dup         
          duped[pos] = self.next_mover_mark
          if self.next_mover_mark == :x
            mark = :o
          else
            mark = :x
          end
          new_node = TicTacToeNode.new(duped, mark,pos)
          children << new_node
        end
      end
  
    end
    children
  end
end
