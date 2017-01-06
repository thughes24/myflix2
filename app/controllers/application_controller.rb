class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in, :current_user
  
  def current_user
  	@user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in
  	!!current_user
  end

	def require_user
		if logged_in
		else
			flash[:notice] = "You need to be logged in to do that."
			redirect_to new_session_path
		end
	end

	def require_no_user
		redirect_to videos_path if logged_in
	end
end
