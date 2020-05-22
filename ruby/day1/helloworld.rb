puts 'Hello, world'

puts 'Hello, Ruby'.index('Ruby')

x = 0
while x < 10
  x = x + 1
  puts "JK"
end

(0..10).each do |i|
  puts "This is sentence number #{i}"
end

content = File.open('dummy.rb').read
content.each_line do |line|
  eval(line)
end

# bonus problem
value = rand(10)
puts "value : #{value}"
input = -1
while value != input
  input = gets().to_i
  puts "input: #{input}"
end