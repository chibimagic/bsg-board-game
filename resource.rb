class Resource
  def initialize(difficulty = :normal)
    case difficulty
    when :normal
      @level = self.class::INITIAL_LEVEL
    when :easy
      @level = self.class::INITIAL_LEVEL + 2
    when :hard
      @level = self.class::INITIAL_LEVEL - 2
    else
      raise 'Difficulty must be one of: easy, normal (default), hard'
    end
  end
  
  def to_s
    @level.to_s
  end
  
  def level
    @level
  end
  
  def increase
    @level = [@level + 1, 15].min
  end
  
  def decrease
    @level -= 1
  end
  
  def in_red_zone?
    @level <= initial_level/2
  end
end

class Food < Resource
  INITIAL_LEVEL = 8
end

class Fuel < Resource
  INITIAL_LEVEL = 8
end

class Morale < Resource
  INITIAL_LEVEL = 10
end

class Population < Resource
  INITIAL_LEVEL = 12
end
