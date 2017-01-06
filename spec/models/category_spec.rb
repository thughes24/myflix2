require 'spec_helper'

describe Category do
	it { should have_many(:videos)}

	describe "#recent_videos" do
		it "should list all videos if less than 6 in category & in reverse chronological order" do
			category = Category.create(name: "Good")
			vid1 = Video.create(title: "one", description: "poo", category: category)
			vid2 = Video.create(title: "two", description: "poo", category: category)
			expect(category.recent_videos).to eq([vid2,vid1])
		end
		it "should list most recent 6 videos if more than 6 in category" do
			category = Category.create(name: "Good")
			vid1 = Video.create(title: "one", description: "poo", category: category)
			vid2 = Video.create(title: "two", description: "poo", category: category)
			vid3 = Video.create(title: "three", description: "poo", category: category)
			vid4 = Video.create(title: "four", description: "poo", category: category)
			vid5 = Video.create(title: "five", description: "poo", category: category)
			vid6 = Video.create(title: "six", description: "poo", category: category)
			vid7 = Video.create(title: "seven", description: "poo", category: category)
			vid8 = Video.create(title: "eight", description: "poo", category: category)
			expect(category.recent_videos).to eq([vid8,vid7,vid6,vid5,vid4,vid3])
		end
		it "returns an empty array if the category does not have any videos" do
			category = Category.create(name: "bad")
			expect(category.recent_videos).to eq([])
		end
	end
end