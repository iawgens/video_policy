json.videos @videos do |video|
	json.(video, :title, :description)
	json.policies video.policies do |policy|
		json.country_iso_code policy.country_code.iso_code
		json.policy_code policy.policy_code
	end
end