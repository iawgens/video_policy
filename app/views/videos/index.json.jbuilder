json.videos @videos do |video|
	json.(video, :title, :description)
end