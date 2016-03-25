class PinsController < ApplicationController

	before_action :get_pin, only:[:show,:edit,:update,:destroy]

	def index
	end

	def show
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

		def pins_params
			params.require(:pin).permit(:title,:description)
		end

		def get_pin
			@pin = Pin.find(params[:id])
		end
end
