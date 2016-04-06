class Beer
  attr_accessor :x, :y, :width, :height

	def initialize(window, index=0)
		@window = window
    @image_beer = Gosu::Image.new(window, 'assets/beer.png')
    @width = @image_beer.width
    @height = @image_beer.height
    reset(window)
		@y = 100
		@x = 800
  end

  def draw
    @image_beer.draw(@x, @y, 1)
  end

	def reset(window)
		@y = Random.rand(window.height - @height)
		@x = window.width
	end

	def move
  @x = @x - 0.5
	end

end
