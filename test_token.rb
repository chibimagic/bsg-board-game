require 'test/unit'
require_relative 'base_game.rb'

class TestToken < Test::Unit::TestCase
  def setup
    @game = BaseGame.new(Array.new(3) { Player.new('') })
  end
  
  def test_viper_initialize
    viper = Viper.new(@game)
    assert_equal(false, viper.damaged)
    assert_equal(false, viper.manned?)
  end
  
  def test_viper_damage_repair
    viper = Viper.new(@game)
    viper.damage!
    assert_equal(true, viper.damaged)
    viper.repair!
    assert_equal(false, viper.damaged)
  end
  
  def test_basestar_initialize
    basestar = Basestar.new(@game)
    assert_equal(false, basestar.damaged?)
    assert_equal(0, basestar.damage)
    assert_equal(0, basestar.damage_tokens.count)
    assert_equal(true, basestar.can_launch_ships)
    assert_equal(true, basestar.can_attack_galactica)
    assert_equal(false, basestar.structural_damage)
  end
  
  def test_basestar_damage_with_disabled_hangar
    basestar = Basestar.new(@game)
    basestar.damage_with_token!(BasestarDamageToken.new(@game, :disabled_hangar))
    assert_equal(true, basestar.damaged?)
    assert_equal(1, basestar.damage)
    assert_equal(1, basestar.damage_tokens.count)
    assert_equal(false, basestar.can_launch_ships)
    assert_equal(true, basestar.can_attack_galactica)
    assert_equal(false, basestar.structural_damage)
    assert_equal(false, basestar.should_be_destroyed?)
  end
  
  def test_basestar_damage_with_disabled_weapons
    basestar = Basestar.new(@game)
    basestar.damage_with_token!(BasestarDamageToken.new(@game, :disabled_weapons))
    assert_equal(true, basestar.damaged?)
    assert_equal(1, basestar.damage)
    assert_equal(1, basestar.damage_tokens.count)
    assert_equal(true, basestar.can_launch_ships)
    assert_equal(false, basestar.can_attack_galactica)
    assert_equal(false, basestar.structural_damage)
    assert_equal(false, basestar.should_be_destroyed?)
  end
  
  def test_basestar_damage_with_structural_damage
    basestar = Basestar.new(@game)
    basestar.damage_with_token!(BasestarDamageToken.new(@game, :structural_damage))
    assert_equal(true, basestar.damaged?)
    assert_equal(1, basestar.damage)
    assert_equal(1, basestar.damage_tokens.count)
    assert_equal(true, basestar.can_launch_ships)
    assert_equal(true, basestar.can_attack_galactica)
    assert_equal(true, basestar.structural_damage)
    assert_equal(false, basestar.should_be_destroyed?)
  end
  
  def test_basestar_damage_with_critical_hit
    basestar = Basestar.new(@game)
    basestar.damage_with_token!(BasestarDamageToken.new(@game, :critical_hit))
    assert_equal(true, basestar.damaged?)
    assert_equal(2, basestar.damage)
    assert_equal(1, basestar.damage_tokens.count)
    assert_equal(true, basestar.can_launch_ships)
    assert_equal(true, basestar.can_attack_galactica)
    assert_equal(false, basestar.structural_damage)
    assert_equal(false, basestar.should_be_destroyed?)
  end
  
  def test_basestar_should_be_destroyed
    data = [
      { :tokens => [:disabled_hangar, :disabled_weapons, :critical_hit], :should_be_destroyed => true },
      { :tokens => [:disabled_hangar, :disabled_weapons, :structural_damage], :should_be_destroyed => true },
      { :tokens => [:disabled_hangar, :critical_hit], :should_be_destroyed => true },
      { :tokens => [:critical_hit, :disabled_weapons], :should_be_destroyed => true },
      { :tokens => [:disabled_hangar, :disabled_weapons], :should_be_destroyed => false }
    ]
    data.each do |datum|
      basestar = Basestar.new(@game)
      datum[:tokens].each do |token|
        basestar.damage_with_token!(BasestarDamageToken.new(@game, token))
      end
      assert_equal(datum[:should_be_destroyed], basestar.should_be_destroyed?)
    end
  end
end
