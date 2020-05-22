
line_num = 0
text = File.open('test.txt').read

text.each_line do |line|
  line_num += 1
  puts "#{line_num} #{line}" if line.match /hihi/
end
