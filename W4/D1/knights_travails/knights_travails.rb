class KnightPathFinder
  attr_accessor :root_node

  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    @considered_pos = [start_pos]
  end

  def self.valid_moves(pos)
    
  end

  def build_move_tree
    
  end


end

class PolyTreeNode

  attr_accessor :children, :value
  attr_reader :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    self.parent.children.delete(self) unless self.parent.nil?
    if node.nil?
      @parent = nil
    else
      @parent = node
      unless node.children.include?(self)
        node.children << self
      end
    end
  end

  def add_child(node)
    node.parent = self
  end

  def remove_child(node)
    if !self.children.include?(node)
      raise
    else
      self.children.delete(node)
    end
    node.parent = nil
  end

  def dfs(value)
    return self if self.value == value
  
    self.children.each do |child|
      search = child.dfs(value)
      return search unless search.nil?
    end
    nil
  end

end