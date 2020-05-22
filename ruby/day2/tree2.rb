class Tree
  attr_accessor :children, :node_name

  def initialize(name, children = {})
    @node_name = name
    @children = []

    children.each { |key, value| @children.push(Tree.new(key, value)) }
  end

  def visit(&block)
    block.call self
  end

  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block }
  end

end

ruby_tree = Tree.new("Ruby", {'grandpa' => {'dad' => {'child 1' => {}, 'child 2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {}}}})

puts "Visiting a node"
ruby_tree.visit { |node| puts node.node_name }
puts

puts "Visiting entire tree"
ruby_tree.visit_all { |node| puts node.node_name }


