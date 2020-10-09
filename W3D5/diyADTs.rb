 class Stack
    attr_reader :array
    def initialize
      @array = []
    end

    def push(el)
      @array << el
    end

    def pop
      @array.pop
    end

    def peek
      @array[0]
    end
  end


class Queue
    attr_reader :line
    def initialize
        @line = []

    end

    def enqueue(el)
        @line << el
    end

    def dequeue(el)
        @line.shift
    end

    def peek
        @line[0]
    end
end

class Map
    def initialize
        @array = []
    end

    def set(key,value)
        if self.any?{|ele| ele[0] == key}
             @array[@array.index(key)][1] = value
        else
            @array << [key, value]
        end

    end

    def get(key) 
        nil || @array.select{|ele| ele[0] == key}
    end

    def show
        @array
    end

end





  def merge_sort(arr)
    return arr if arr.length < 2
    mid = arr.length / 2
    left = merge_sort(arr[0...mid])
    right = merge_sort(arr[mid..-1])

    merge(left, right)

  end

  def merge(left, right)
    arr = []
    until left.empty? || right.empty?
        left.first > right.first ? arr << right.shift : arr << left.shift
    end

    return arr + left + right
    
  end

  arr = [1,5,7,2,3,5,6,7,3,2]

# p merge_sort(arr)


def bsearch(arr, target)
    mid = (arr.length / 2)
    return mid if arr[mid] == target
    return arr.length -1 if [arr.length - 1] == target
    return 0 if arr[0] == target
    if arr[mid] > target
        #look left
        bsearch(arr[0..mid], target)
        
    else
        #look right
        mid + bsearch(arr[mid..-1], target)
        
    end

    

end



