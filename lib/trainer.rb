class Trainer
  attr_accessor :name, :kudomons, :position, :level

  def initialize(name)
    @name = name
    @kudomons = []
    @position = nil
    @level = 0
  end
  def euclidean_distance(kudomon)
    # Math.sqrt((kudomon.position[0] - position[0])**2 + (kudomon.position[1] - position[1])**2)
    # smort

    # array_of_squares = []
    # kudomon.position.each_with_index do |coordinate, index|
    #   array_of_squares << (coordinate - position[index])**2
    # end
    # Math.sqrt(array_of_squares.reduce(:+))
    # Also smort but I'm overthinking it

    distance_on_x = (kudomon.position[0] - position[0]).abs
    distance_on_y = (kudomon.position[1] - position[1]).abs
    distance_on_x + distance_on_y
    # muuuch better
  end
  def detect(kudomon)
    return false if kudomon.position.nil?
    return false if position.nil?
    return false if euclidean_distance(kudomon) > 5
    true
  end

  def catch(kudomon)
    raise 'This kudomon has already been caught' if kudomon.trainer
    kudomons << kudomon
    kudomon.position = nil
    kudomon.trainer = self
  end
end
