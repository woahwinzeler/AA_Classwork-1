def first_anagram?(string_1, string_2)
  sub_string = string_1.split("")
  sub_array = sub_string.permutation(string_1.length).to_a

  sub_array.each.with_index { |arr, i| sub_array[i] = arr.join("") }

  sub_array.flatten.include?(string_2)
end

def anagram_2(string_1, string_2)
  letter1 = string_1.split('')
  letter2 = string_2.split('')

  letter1.each do |i|
    i2 = letter2.find_index(i)
  end
end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true