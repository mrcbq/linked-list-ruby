class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def initialize(value = nil)
    @head = @tail = nil
    @size = 0
    add(value) unless value.nil?
  end

  def add(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = @tail = new_node
    else
      @tail.next_node = @tail = new_node
    end
    @size += 1    
  end

  def addAt(index, value) 
    # if index < 0 || index > @size
    #   raise IndexError, "Index out of bounds"
    # end
    raise IndexError, "Index out of bounds" if index_bad?(index)

    if index == 0
      @head = Node.new(value, @head)
      @size += 1
    else
      prev_node = get_node(index - 1)
      prev_node.next_node = Node.new(value, prev_node.next_node)
      @size += 1
    end
  end

  def get_node(index)
    raise IndexError, "Index out of bounds" if index_bad?(index)

    current_node = @head
    index.times do
      current_node = current_node.next_node
    end
    current_node
  end

  def get(index)
    get_node(index).value
  end

  def remove

  end

  private

  def index_bad?(index)
    index < 0 || index >= @size
  end
end

list = LinkedList.new(0)
list.add(1)
list.add(2)
list.add(3)
list.get_node(3)
list.addAt(0, -1)
pp list.get(0)
pp list