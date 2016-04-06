class Player

	attr_accessor :x, :y, :width, :height

	def initialize(window)
    @window = window
		@image = Gosu::Image.new(window,'assets/sprite.png')
		@x = @window.width/2 - @image.width/2
		@y = @window.height/2 - @image.height/2
	end

	def draw
		@image.draw(@x,@y,1)
	end

	def move_right
		@x -= -2
	end

	def move_left
		@x += -2
	end

	def collides_with_beer?(beer)
		Gosu::distance(@x,@y, beer.x, beer.y) < 50
	end

	def collides_with?(enemy)
		Gosu::distance(@x,@y, enemy.x, enemy.y) < 50
	end
end
