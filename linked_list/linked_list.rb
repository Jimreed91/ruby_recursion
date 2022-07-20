require 'pry-byebug'
class LinkedList
  attr_accessor :head
  attr_reader :size

  def initialize
    @head = nil
    @size = 0
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      tail.next_node = Node.new(value)
    end
    @size += 1
  end

  def prepend(value)
    @head = Node.new(value, @head)
    @size += 1
  end

  def tail(node = @head)
    return node if node.next_node.nil?

    tail(node.next_node)
  end

  def at(index, node = @head)
    return node if index.negative?

    at(index - 1, node.next_node)
  end
end

class Node
  attr_accessor :next_node, :value

  def initialize(value = nil, next_node = nil)
    @next_node = next_node
    @value = value
  end
end

test_list = LinkedList.new
test_list.append(5)
test_list.append(10)

test_list.append(12)
test_list.prepend(3)
binding.pry
test_list.append(11)
