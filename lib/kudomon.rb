class Kudomon
  attr_accessor :species, :type, :position

  def initialize(species, type)
    @species = species
    @type = type
    @position = nil
  end
end
