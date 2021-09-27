class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    key = 0
    copy = self.dup
    until copy.empty?
      key = key * 10
      key += copy.shift
    end
    return key
  end
end

class String
  def hash
    return -1 if self.nil?
    alphabet = ('a'..'z').to_a
    key = 0
    copy = self.dup.downcase
    until copy.empty?
      key = key * 10
      key += alphabet.index(copy[0]) + 1
      copy = copy[1..-1]
    end
    return key
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
