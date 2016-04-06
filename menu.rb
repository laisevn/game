class Menu  < Gosu::Window

  def initialize window
		super 640, 480, false
    @window, @display = window, true
    @bg = Gosu::Image.new window, 'assets/menu.jpg', true

  end

	attr_accessor :display

  def draw
    @bg.draw(1,0,0) if display
	end

	# def update
	# 	new_game if button_down? Gosu::KbEnter
	# end

  #novo jogo quando botão é acionado
  def new_game
    @display = false
		@window = false
  end


end
