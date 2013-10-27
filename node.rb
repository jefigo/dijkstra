class Node

   attr_accessor :distance, :edges, :unvisited
   attr_reader   :name

   @@infinite = -1
  
  def initialize(name)
    @name = name
    @distance = @@infinite
    @edges = [] 
    @unvisited = true
  end

end


