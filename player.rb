class Player
  attr_accessor :nama, :blood, :mana
  
  def initialize nama
	@nama = nama
    @blood = 100
    @mana = 40
  end
  
  def attack
    @mana = @mana - 20
  end
  
  def defense
    @blood = @blood - 20
  end
  
  def gameOver
     @mana <= 0 || @blood <=0
  end

end
