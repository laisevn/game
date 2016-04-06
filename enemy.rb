class Enemy

	attr_accessor :y, :x

	def initialize(window, index=0)
		@image = Gosu::Image.new(window,'assets/enemy1.png')
		@y = 100
		@x = 900
    @x = 640 + index * 200
		[index]
	end

	def draw
		@image.draw(@x,@y,1)
	end

	def move
		@x -= 10
		@x = 900 if @x < -50
	end
end
