class Edge

  attr_reader  :first_node, :second_node, :weight

  def initialize(first_node, second_node, weight)
    @first_node = first_node
    @second_node = second_node
    @weight = weight
  end

end