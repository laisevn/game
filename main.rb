require 'rubygems'
require 'gosu'
require_relative 'player.rb'
require_relative 'enemy.rb'
require_relative 'level.rb'
require_relative 'menu.rb'
require_relative 'beer.rb'


class Main < Gosu::Window

	def initialize
		super 640, 480, false
    self.caption = 'Where is my beer?'
    @level = Level.new(self)
    @menu = Menu.new(self)
	end

	attr_reader :level, :menu

	def button_down(id)
		puts id
		puts Gosu::KbEnter
		@menu.display = false if [40, Gosu::KbEnter ].include?(id) && @menu.display
	end

	def draw
		@menu.draw
    @level.draw if @menu.display === false
	end

	def update
		@menu.update
		@level.update
	end

end

window = Main.new
window.show
