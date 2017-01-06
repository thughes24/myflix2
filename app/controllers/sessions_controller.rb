class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			flash[:notice] = "Login Successful."
			redirect_to videos_path
		else
			flash[:notice] = "Incorrect Username/Password."
			redirect_to new_session_path
		end
	end
	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end
end