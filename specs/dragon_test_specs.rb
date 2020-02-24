require('minitest/autorun')
require('minitest/reporters')
require_relative('../dragon')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


class DragonTest < Minitest::Test
  def test__name
    dragon = Dragon.new("Bahamut", "silver_white", 1600,{"Breath_weapon"=>100,"crush"=>300,"tail_sweep"=>400})
    assert_equal "Bahamut", dragon.name
  end

   def test_allegiance_good

     dragon = Dragon.new("Bahamut","silver_white", 1600,{"Breath_weapon"=>100,"crush"=>300,"tail_sweep"=>400})
     assert_equal "lawfull good",dragon.allegiance
   end

   def test_allegiance_evil

     dragon = Dragon.new("Tiamat","polychromatic", 1600,{"Breath Weapon"=>120, "Flyby Attack"=>70, "Power Attack"=>100,})
     assert_equal "chaotic evil",dragon.allegiance
   end

    def test_it_has_a_color

  dragon = Dragon.new("Bahamut","silver_white", 1600,{"Breath_weapon"=>100,"crush"=>300,"tail_sweep"=>400})
     assert_equal "silver_white",dragon.color
   end

   def test_dragons_eat_a_lot

     dragon = Dragon.new("Bahamut","silver_white", 1600,{"Breath_weapon"=>100,"crush"=>300,"tail_sweep"=>400})
     assert dragon.hungry?
     dragon.eat
     assert dragon.hungry?
     dragon.eat
     assert dragon.hungry?
     dragon.eat
     refute dragon.hungry?
   end

   def test_a_different_dragons_color

    dragon = Dragon.new("Tiamat","polychromatic", 1600,{"Breath Weapon"=>120, "Flyby Attack"=>70, "Power Attack"=>100,})
     assert_equal "polychromatic", dragon.color
   end

   def test_dragon_is_alive
     dragon = Dragon.new("Bahamut","silver_white", 1600,{"Breath_weapon"=>100,"crush"=>300,"tail_sweep"=>400})
     assert dragon.dragon_alive?
   end

   def test_dragon_is_dead
     dragon = Dragon.new("Bahamut","silver_white", 1600,{"Breath_weapon"=>1000,"crush"=>300,"tail_sweep"=>400})
     dragon.hit_points=0
     refute dragon.dragon_alive?
   end

   def test_single_attack
     bahamut = Dragon.new("Bahamut","silver_white", 1600,{"Breath_weapon"=>1000,"crush"=>300,"tail_sweep"=>400})
     tiamat = Dragon.new("Tiamat","polychromatic", 1600,{"Breath Weapon"=>120, "Flyby Attack"=>70, "Power Attack"=>100,})

     bahamut.battle("Breath_weapon",tiamat)
     assert_equal(600,tiamat.hit_points)
  end

  def test_battle_to_death
    bahamut = Dragon.new("Bahamut","silver_white", 1600,{"Breath_weapon"=>1000,"crush"=>300,"tail_sweep"=>400})
    tiamat = Dragon.new("Tiamat","polychromatic", 1600,{"Breath Weapon"=>120, "Flyby Attack"=>70, "Power Attack"=>100,})

    bahamut.battle("Breath_weapon",tiamat)
    bahamut.battle("crush",tiamat)
    bahamut.battle("tail_sweep",tiamat)
    refute tiamat.dragon_alive?
    assert bahamut.dragon_alive?
 end


end
