load "player.rb"

class Menu
  @@players = Array.new
  @@stat = "1"
  def start
  puts "#==============================#"
  puts "# Welcome to Battle Arena #"
  puts "#-----------------------------------------------------#"
  puts "# Description : #"
  puts "# 1. ketik “new” untuk membuat karakter #"
  puts "# 2. ketik “start” untuk memulai pertarungan #"
  puts "#-----------------------------------------------------#"
  puts "# Current Player :          #"
  puts "#"
  puts "#"
  puts "# * max player 2 atau 3"
  puts "#"
  puts "#-----------------------------------------------------#"
  @n = 0
  listen()
  end

  def listen
  while !gameOver() do
      if @@stat.eql? "1" and @@players.length <= 2 then
        puts "select : "
        input = gets.chomp
      else
        input = "start"
      end
      
      if input.eql? "new" then
        @@stat = "1"
        puts "Input player name : "
        nama = gets.chomp
        @@players.push Player.new nama
      
      elsif input.eql? "start" then
        if @@players.length <= 1 then
          puts "At least 2 Player needed"
        else
          @@stat = "2"
          
          puts "Attacker : "
          attack = gets.chomp
          puts "Target : "
          target = gets.chomp
          
         
          for player in @@players do
            if player.nama.eql? attack then
               player.attack
            elsif player.nama.eql? target then
               player.defense
            end
            puts "#{player.nama} : mana = #{player.mana}, blood = #{player.blood}"             
          end
        end
      else
        puts "Input Error"
      end
    end
    puts "Game Over"
  end

  def gameOver
    status = false
    
    for player in @@players do
	  status = status || player.gameOver.()   
	end
	
	status
  end

  def gameOver
    status = false
    
    for player in @@players do
	  status = status || player.gameOver()   
	end
	
	status
  end
end
main = Menu.new 
main.start
