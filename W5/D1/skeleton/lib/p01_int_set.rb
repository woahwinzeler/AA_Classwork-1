class MaxIntSet

  attr_reader :store, :max

  def initialize(max)
    @max = max
    @store = Array.new(@max) { Array.new }
  end

  def insert(num)
    if num > max
      raise 'Out of bounds'
    else
      if num > store.last
        (num - store.last - 1).times { store << false }
      end
      store[num] = true
      return true
    end
  end

  def remove(num)
    store.delete_at(num) if store.include?(num)
  end

  def include?(num)
    store.include?(num)
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
