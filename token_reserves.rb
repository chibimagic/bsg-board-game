class TokenReserves
  def initialize(game)
    @game = game
    @reserves = []
  end

  def to_s
    @reserves.count.to_s
  end
  
  def count
    @reserves.count
  end
  
  def draw
    @reserves.shift
  end
  
  def replace(token)
    @reserves.push(token)
  end
end

class ShipTokenReserves < TokenReserves
  def initialize(game)
    super(game)
    self.class::TOKEN_COUNT.times { @reserves.push(self.class::TOKEN_CLASS.new(game)) }
  end
end

class ViperReserves < ShipTokenReserves
  TOKEN_CLASS = Viper
  TOKEN_COUNT = 8
end

class RaptorReserves < ShipTokenReserves
  TOKEN_CLASS = Raptor
  TOKEN_COUNT = 4
end

class RaiderReserves < ShipTokenReserves
  TOKEN_CLASS = Raider
  TOKEN_COUNT = 16
end

class HeavyRaiderReserves < ShipTokenReserves
  TOKEN_CLASS = HeavyRaider
  TOKEN_COUNT = 4
end

class CenturionReserves < ShipTokenReserves
  TOKEN_CLASS = Centurion
  TOKEN_COUNT = 4
end

class BasestarReserves < ShipTokenReserves
  TOKEN_CLASS = Basestar
  TOKEN_COUNT = 2
end

class DamageTokenReserves < TokenReserves
  def initialize(game)
    super(game)
    self.class::TO_DAMAGE_CLASSES.each do | to_damage_class |
      @reserves.push(self.class::TOKEN_CLASS.new(game, to_damage_class))
    end
    @reserves.shuffle!
  end
  
  def replace(token)
    super(token)
    @reserves.shuffle!
  end
end

class GalacticaDamageReserves < DamageTokenReserves
  TOKEN_CLASS = GalacticaDamageToken
  
  TO_DAMAGE_CLASSES = [
    Food,
    Fuel,
    FTLControl,
    WeaponsControl,
    Command,
    AdmiralsQuarters,
    HangarDeck,
    Armory
  ]
end

class CivilianShipReserves < DamageTokenReserves
  TOKEN_CLASS = CivilianShipDamageToken
  
  TO_DAMAGE_CLASSES = [
    [],
    [],
    [Population],
    [Population],
    [Population],
    [Population],
    [Population],
    [Population],
    [Population, Fuel],
    [Population, Population],
    [Population, Population],
    [Population, Morale]
  ]
end

class BasestarDamageReserves < DamageTokenReserves
  TOKEN_CLASS = BasestarDamageToken
  
  TO_DAMAGE_CLASSES = [
    :critical_hit,
    :disabled_hangar,
    :disabled_weapons,
    :structural_damage
  ]
end
