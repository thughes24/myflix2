class StaticController < ApplicationController
	before_action :require_no_user
	def index

	end
end