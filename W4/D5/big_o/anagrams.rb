def first_anagram?(string_1, string_2)
  sub_string = string_1.split("")
  sub_array = sub_string.permutation(string_1.length).to_a

  sub_array.each.with_index { |arr, i| sub_array[i] = arr.join("") }

  sub_array.flatten.include?(string_2)
end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true