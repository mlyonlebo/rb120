=begin
write a CircularQueue class
CircularQueue::new accepts an arg representing buffer size
It provides an enqueue method to add an object to a queue
dequeue to remove and return the oldest object in the queue
  *return nil if the queue is empty

represent the buffer as an array
add elements to the array until you hit buffer size
subsequently, each additional element means removing the oldest (first)

=end

class CircularQueue
  attr_accessor :queue, :buffer_size

  def initialize(buffer_size)
    @buffer_size = buffer_size
    @queue = []
  end

  def enqueue(object)
    if queue.size < buffer_size
      queue << object
    else
      dequeue
      queue << object
    end
  end

  def dequeue
    queue.shift
  end
end


queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil