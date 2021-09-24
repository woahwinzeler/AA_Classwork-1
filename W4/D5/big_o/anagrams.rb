
def my_min_1(array)
  min = 0
  (0...array.length).each do |i|
    min = array[i]
    (i+1...array.length).each do |j|
      break if array[i] > array[j]
    end
    break
  end
  min
end

def my_min(array)
  min = 0
  array.each do |num|
    if num < min
      min = num
    end
  end
  return min
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
my_min_1(list)  # =>  -5