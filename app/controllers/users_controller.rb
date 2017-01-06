class UsersController < ApplicationController
	before_action :require_no_user
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = 'Account Created Successfully.'
			session[:user_id] = @user.id
			redirect_to videos_path
		else
			render :new
		end
	end

	def user_params
		params.require(:user).permit!
	end
end