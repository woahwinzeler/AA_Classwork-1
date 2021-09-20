class KnightPathFinder
  attr_accessor :root_node, :considered_pos

  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    @considered_pos = [start_pos]
  end

  def self.valid_moves(pos)
    x, y = pos
    valid = [[x+2, y+1], 
    [x+2, y-1], 
    [x+1, y+2], 
    [x+1, y-2], 
    [x-1, y+2], 
    [x-1, y-2], 
    [x-2, y+1], 
    [x-2, y-1]]

  end

  def new_move_positions(pos)
    new_pos = KnightPathFinder.valid_moves(pos) - considered_pos
    considered_pos.concat(new_pos)
    new_pos
  end

  def build_move_tree(final_pos)
    qeueu = [root_node]
    until qeueu.empty?
      p qeueu
      puts
      new_move_positions(qeueu[0].value).map do |positions|
        qeueu[0].add_child(PolyTreeNode.new(positions))
      end
      var = qeueu.shift
      if var.value == final_pos
        return var
      else
        qeueu.concat(var.children)
      end
    end
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

  def inspect
    value
  end

end

kpf = KnightPathFinder.new([0, 0])
p kpf.build_move_tree([5, 4])
# p kpf.new_move_positions([1,1])
# puts
# p kpf.new_move_positions([2,3])
# p kpf.root_node.value