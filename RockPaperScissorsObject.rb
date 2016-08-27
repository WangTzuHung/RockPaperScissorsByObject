class RpsPlayer
	attr_accessor :strRPS, :intPRS

	def ConvertToString(intRPS)
		case intRPS
			when 0 then "Rock!!"
			when 2 then "Scissors!!"
			when 5 then "Paper!!" 
		end
	end

end

class HumanRpsPlayer < RpsPlayer
	attr_accessor :UsersRPS
  def SetPRS
		begin
			puts "Please Choose the RPS by Number that You Want"
			puts"(0)Rock (2)Scissors (5)Paper"
			self.UsersRPS = gets.chomp.to_i
		end while ![0,2,5].include?(self.UsersRPS)
	  self.intPRS = self.UsersRPS
	  self.strRPS = ConvertToString(self.intPRS)
	end
end

class ComputerPlayer < RpsPlayer
  def AutoSetPRS
  	self.intPRS = [0,2,5].sample
  	self.strRPS = ConvertToString(self.intPRS)
  end

end

class RpsGame
	attr_accessor :RpsPlayer, :ComputerPlayer

	def WhoWin
		puts "You Choose #{self.RpsPlayer.strRPS}"  
		puts "The Computer Choose #{self.ComputerPlayer.strRPS}"
		case self.RpsPlayer.intPRS - self.ComputerPlayer.intPRS
			when 0 then puts "Draw!!"
			when -2 then puts "YouWin!!"
			when 2 then puts "YouLose!!" 
			when 3 then puts "YouLose!!"
			when -3 then puts "YouWin!!"
			when 5 then puts "YouWin!!"
			when -5 then puts "YouLose!!"
		end
	end
end

RpsGame1 = RpsGame.new();

RpsGame1.RpsPlayer = HumanRpsPlayer.new()
RpsGame1.ComputerPlayer = ComputerPlayer.new();

RpsGame1.RpsPlayer.SetPRS
RpsGame1.ComputerPlayer.AutoSetPRS
RpsGame1.WhoWin
begin
	begin
		puts "Play Again? (Y)/(N)"
		YesOrNo = gets.chomp.to_s.upcase
	end while !["N","Y"].include?(YesOrNo)
	puts
	if(YesOrNo == "Y")
		RpsGame1.RpsPlayer.SetPRS
		RpsGame1.ComputerPlayer.AutoSetPRS
		RpsGame1.WhoWin
	end
end while YesOrNo != "N"

puts "BYE!"