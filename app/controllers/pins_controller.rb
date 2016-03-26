class PinsController < ApplicationController

	before_action :get_pin, only:[:show,:edit,:update,:destroy,:upvote]
	before_action :authenticate_user!, except:[:index,:show]

	def index
		@pins = Pin.all.order("created_at DESC")
	end

	def show
	end

	def upvote
		@pin.upvote_by current_user
		redirect_to :back
	end

	def new
		@pin = current_user.pins.build
	end

	def create
		@pin = current_user.pins.build(pins_params)
		if @pin.save
			redirect_to @pin,notice: "Successfully created the Pin!"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @pin.update(pins_params)
			redirect_to @pin, notice:"Successfully Updated!"
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
			params.require(:pin).permit(:title,:description,:image)
		end

		def get_pin
			@pin = Pin.find(params[:id])
		end
end
