class Api::V1::UsersController < ApplicationController
	before_action :set_user,only: [:update,:destroy,:show]
	respond_to :json
	skip_before_filter :verify_authenticity_token

	def show
		respond_with @user
	end
	def create
		user = User.new(user_params)
		if user.save
			render json: user, status: 201
		else
			render json: { errors: user.errors}, status: 422
		end
	end
	def update
		if @user.update(user_params)
		  render json: @user, status: 200
		else
		  render json: { errors: @user.errors }, status: 422
		end
	end

	def destroy
		@user.destroy
		head 204
	end


	private
	def set_user
		@user = User.find(params[:id])
	end
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end
