require 'spec_helper'

describe Video do
	it "saves itself" do
		video = Video.new(title: "monk", description: "good vid")
		video.save
		expect(Video.first.title).to eq("monk")
	end
	it { should belong_to(:category)}
	it { should validate_presence_of(:title)}
	it { should validate_presence_of(:description)}

	describe "search_by_title(string)" do
		it "returns empty array if no videos found" do
			Video.create(title: "poop", description: "farts")
			expect(Video.search_by_title("socks")).to eq([])
		end
		it "returns array of vidoes if one video found" do
			poop = Video.create(title: "poop", description: "socks")
			expect(Video.search_by_title("poop")).to eq([poop])
		end
		it "returns array of multiple videos if more than one video found" do
			vid1 = Video.create(title: "any", description: "poop")
			vid2 = Video.create(title: "anyhow", description: "still poop")
			expect(Video.search_by_title("any")).to eq([vid2,vid1])
		end
		it "returns array if partial match" do
			vid1 = Video.create(title: "wet", description: "socks")
			expect(Video.search_by_title("we")).to eq([vid1])
		end
		it "is case insensitive" do
			vid1 = Video.create(title: "POO", description: "fart")
			expect(Video.search_by_title("po")).to eq([vid1])
		end
		it "orders by created_at" do
			vid1 = Video.create(title: "any", description: "poop")
			vid2 = Video.create(title: "anyhow", description: "still poop")
			expect(Video.search_by_title("an")).to eq([vid2,vid1])
		end
		it "returns an empty array if empty search" do
			vid1 = Video.create(title: "any", description: "poop")
			vid2 = Video.create(title: "anyhow", description: "still poop")
			expect(Video.search_by_title("")).to eq([])
		end
	end
end