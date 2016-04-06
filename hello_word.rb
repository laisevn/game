require 'rubygems'
require 'gosu'


class Main < Gosu::Window

	def initialize
		super 600, 480, false
		self.caption = "SUPIMPA!"
	end

	def draw

	end

	def update

	end
end

window = Main.new
window.show
