class GraphNode
    attr_accessor :value, :neighbors
    def initialize(value)
        @value = value
        @neighbors = []
    end

    def add_neighbor(node)
        self.neighbors << node
    end

    def bfs(starting_node, target_value)
    queue = [starting_node]
    until queue.empty?
      node = nodes.shift
      return node if starting_node == target_value
      queue.concat(node.children)
    end

    nil
    end

end

