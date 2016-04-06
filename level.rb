class Level < Gosu::Window

	def initialize window
		super 640, 280, false
		@player = Player.new(self)
		@enemy = Enemy.new(self)
		@beer = Beer.new(self)
		@score = 0
		@score_text = Gosu::Font.new(self, 'Arial', 72)
		@background = Gosu::Image.new(self, 'assets/background.png')
		@background_x = 0
		@crash_sound = Gosu::Sample.new(self, 'music/crash.wav')
	end

	def draw
		@beer.draw
		@player.draw
		@enemy.draw
		@score_text.draw("#{@score}", 0, 0, 1)
		@background.draw(@background_x,0,0)
	end

	def scroll_background
		@background_x -= 1
		@background_x = 0 if @background_x < -640
	end

	def update

   scroll_background

	# Update player
		if button_down? Gosu::KbLeft
		   @player.move_left
		elsif button_down? Gosu::KbRight
		  @player.move_right
		elsif button_down? Gosu::KbUp
			@player.y =  [@player.y - 10, 85].max
		elsif button_down? Gosu::KbDown
			@player.y = [@player.y + 10, 225].min
		end
  # Update beer
		@beer.move
		@beer.reset(self) if @beer.x < 0
		if @player.collides_with_beer? @beer
			@score = @score + 1
		  @beer.reset(self)
		end


	# Update enemy
		@enemy.move

	# Game updates
		@crash_sound.play if @player.collides_with?(@enemy)
	end
end
