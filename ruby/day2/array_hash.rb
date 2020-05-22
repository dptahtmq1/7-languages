a = []

(1..16).each { |i|
  a.push(i)
}

a.each_slice(4) { |values| puts values.inspect }

# a.each(4) { |value| puts value; puts }
#

(1..16).each_slice(4) { |values| puts values.inspect }