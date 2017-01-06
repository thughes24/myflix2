class Video < ActiveRecord::Base
	belongs_to :category
	validates :title, presence: :true
	validates :description, presence: :true
	default_scope { order(created_at: :desc) }

	def self.search_by_title(str)
		videos = []
		if !str.blank?
			str.downcase
			Video.where("lower(title) LIKE ?", "%#{str}%").order("created_at DESC").each do |vid|
				videos << vid
			end
		end
		videos
	end
end