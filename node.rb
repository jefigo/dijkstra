class Node

   attr_accessor :distance, :edges
   attr_reader   :name
   attr_writer   :unvisited

   @@infinite = -1
  
  def initialize(name)
    @name = name
    @distance = @@infinite
    @edges = [] 
    @unvisited = true
  end

  def unvisited?
    @unvisited
  end

end


