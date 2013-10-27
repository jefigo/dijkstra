class Node

   attr_accessor :distance, :edges, :unvisited
   attr_reader   :name
  
  def initialize(name)
    @name = name
    @distance = -1
    @edges = [] 
    @unvisited = true
  end

end


