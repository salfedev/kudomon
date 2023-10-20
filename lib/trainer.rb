class Trainer
  attr_accessor :name, :kudomons, :position, :level

  def initialize(name)
    @name = name
    @kudomons = []
    @position = nil
    @level = 0
  end
end
