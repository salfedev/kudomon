class Kudomon
  attr_accessor :species, :type, :position, :trainer, :health_points, :level
  attr_reader :moves
  def initialize(species, type)
    @species = species
    @type = type
    @position = nil
    @trainer = nil
    @health_points = 100
    @level = 1
    @attack_points = 10
    @moves = []
  end

  def lose_health_points(points)
    raise 'This kudomon is already dead' if @health_points - points <= 0
    @health_points -= points
  end

  def attack(kudomon)
    kudomon.lose_health_points(10)
  end

  def attack_points
    @attack_points * @level
  end

  def level_up
    @level += 1
  end

  def learn_move(move)
    @moves << move
  end
end
