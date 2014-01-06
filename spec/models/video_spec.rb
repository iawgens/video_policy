require 'spec_helper'

describe Video do
	describe ".filter" do
		before :each do
			videos = []
			3.times do |i|
				videos << create(:video, title: "VID#{i}")
			end

			#setup video policy
			videos_policies = [
				{'US' => 'monetize', 'CA' => 'free', 'MX' => 'block'},
				{'US' => 'block', 'CA' => 'monetize', 'MX' => 'free'},
				{'US' => 'monetize', 'CA' => 'block', 'MX' => 'block'}
			]

			videos.each_with_index do |video, i|
				['US','CA','MX'].each do |code|
					policy_code = videos_policies[i][code]
					country_code = create :country_code, iso_code: code
					create :policy, video: video, country_code: country_code, policy_code: policy_code
				end
			end
		end

		context "with params" do
			it "returns videos available in specific country" do
				videos = Video.filter(country_code: 'US', policy_codes: ['free','monetize'])
				expect(videos.collect(&:title)).to include('VID0', 'VID2')
				expect(videos.collect(&:title)).to_not include('VID1')
			end
		end

		context "without params" do
			it "returns all videos" do
				videos = Video.filter	
				expect(videos.collect(&:title)).to include('VID1','VID0','VID2')
			end
		end
	end
end