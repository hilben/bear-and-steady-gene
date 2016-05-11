# Enter your code here. Read input from STDIN. Print output to STDOUT
puts "enter length"
#length = gets.to_i
puts "enter string"
#string = gets.chomp.chars
string = 'AAATAAAA'
length = string.chomp.size

max_count = length / 4
puts "maxcount #{max_count}"
replace_size = 0
bases = 'ATCG'.chars
counts = Hash.new
bases.each do |b|
  counts[b.to_sym] = -max_count
end

path = string.chars.map do |c|
   count = counts[c.to_sym] + 1
   replace_size += 1 if count > 0
   counts[c.to_sym] = count
   counts.clone
end

puts counts
puts "path"
path.each do |p|
  print p.values
  score = p.values.map(&:abs).inject(&:+)
  print "score: #{score}"
  puts
end


puts "replace_size #{replace_size}"

puts "result"
#asputs result
