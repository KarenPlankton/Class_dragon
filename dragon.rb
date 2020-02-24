class Dragon

  attr_accessor:name,:allegiance,:color,:hit_points,:attacks
  def initialize(name,color,hit_points,attacks={})
    @name=name
    if @name=="Bahamut"
      @allegiance="lawfull good"
    else
      @allegiance="chaotic evil"
    end
    @color=color
    @hit_points=hit_points
    @attacks=attacks
    @hungry=true
    @food=0
  end

  def hungry?
    @hungry
  end

  def eat
    @food=@food+1
    if @food >= 3
      @hungry=false
  end
end

def dragon_alive?
  if @hit_points>0
    return true
  else
    return false
  end
end

def battle(attack,dragon_2)
  attack_hit_points=@attacks[attack]
  dragon_2.hit_points=dragon_2.hit_points - attack_hit_points
end


end
