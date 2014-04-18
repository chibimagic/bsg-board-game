class Token
  def initialize(game)
    @game = game
  end

  def to_s
    self.class::TITLE
  end
end

class ShipToken < Token
end

class Viper < ShipToken
  TITLE = "Viper"
  def initialize(game, player = nil)
    super(game)
    @damaged = false
    @player = player
  end
  
  def to_s
    pilot = is_manned? ? @player.to_s : 'unmanned'
    self.class::TITLE + ' (' + pilot + ')'
  end
  
  def is_manned?
    @player.nil? ? false : true
  end

  def is_damaged?
    @damaged
  end
  
  def damage
    @damaged = true
  end
  
  def repair
    @damaged = false
  end
end

class Raptor < ShipToken
  TITLE = "Raptor"
end

class Raider < ShipToken
  TITLE = "Raider"
end

class HeavyRaider < ShipToken
  TITLE = "Heavy Raider"
end

class Centurion < ShipToken
  TITLE = "Centurion"
end

class Basestar < ShipToken
  attr_reader \
    :damage_tokens, \
    :can_launch_ships, \
    :can_attach_galactica, \
    :structural_damage
  
  TITLE = "Basestar"
  
  def initialize(game)
    super(game)
    @damage_tokens = []
    @can_launch_ships = true
    @can_attack_galactica = true
    @structual_damage = false
  end
  
  def damage
    damage = @damage_tokens.count
    if @damage_tokens.include? :critical_hit
      damage += 1
    end
    damage
  end
  
  def is_damaged?
    damage > 0
  end
  
  def damage_with_token(damage_token)
    @damage_tokens.push(damage_token)
    
    case damage_token.to_damage_class
    when :critical_hit
      # Counts as extra damage
    when :disabled_hangar
      @can_launch_ships = false
    when :disabled_weapons
      @can_attack_galactica = false
    when :structural_damage
      @structural_damage = true
    end
  end
end

class DamageToken < Token
  attr_reader :to_damage_class
  
  def initialize(game, to_damage_class)
    super(game)
    @to_damage_class = to_damage_class
  end
end

class GalacticaDamageToken < DamageToken
  TITLE = "Galactica Damage Token"
end

class CivilianShipDamageToken < DamageToken
  TITLE = "Civilian Ship"
end

class BasestarDamageToken < DamageToken
  TITLE = "Basestar Damage Token"
end
