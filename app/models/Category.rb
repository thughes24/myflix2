class Category < ActiveRecord::Base
	has_many :videos
	default_scope { order(created_at: :desc) }

	def recent_videos
		vids = []
		videos[0,6].each do |video|
			vids << video
		end
		vids
	end
end