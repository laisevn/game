require 'rubygems' 
require 'gosu'


class Main < Gosu::Window

	def initialize 
		super 640, 280, false
		@player = Player.new(self)
		@enemy = Enemy.new(self)
		@background = Gosu::Image.new(self, 'background.png')
		@background_x = 0
		@crash_sound = Gosu::Sample.new(self, 'death.wav')
	end

	def draw 
		@player.draw
		@enemy.draw
		@background.draw(@background_x,0,0)
	end

	def scroll_background
		@background_x -= 1 
		@background_x = 0 if @background_x < -640
	end

	def update
		scroll_background
		if button_down? Gosu::KbUp
			@player.y =  [@player.y - 10, 0].max
		elsif button_down? Gosu::KbDown
			@player.y = [@player.y + 10, 225].min
		end
		@enemy.move
		@crash_sound.play if @player.collides_with?(@enemy)
	end
end

class Player

	attr_accessor :y

	def initialize(window)
		@image = Gosu::Image.new(window,'sprite.png')
		@y = 100
		@x = 0
	end

	def draw
		@image.draw(@x,@y,1)
	end

	def collides_with?(enemy)
		Gosu::distance(@x,@y, enemy.x, enemy.y) < 50
	end
end

class Enemy

	attr_accessor :y, :x

	def initialize(window)
		@image = Gosu::Image.new(window,'enemy1.png')
		@y = 100
		@x = 900
	end

	def draw
		@image.draw(@x,@y,1)
	end

	def move
		@x -= 2 
		@x = 900 if @x < -50
	end
end

window = Main.new
window.show