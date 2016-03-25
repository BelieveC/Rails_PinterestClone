class PinsController < ApplicationController

	before_action :get_pin, only:[:show,:edit,:update,:destroy]

	def index
		@pins = Pin.all.order("created_at DESC")
	end

	def show
	end

	def new
		@pin = Pin.new
	end

	def create
		@pin = Pin.new(pins_params)
		if @pin.save
			redirect_to @pins_params
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @pin.update(pins_params)
			redirect_to @pins_params
		else 
			render 'edit'
		end
	end

	def destroy
		@pin.destroy
		redirect_to root_path
	end

	private

		def pins_params
			params.require(:pin).permit(:title,:description)
		end

		def get_pin
			@pin = Pin.find(params[:id])
		end
end
