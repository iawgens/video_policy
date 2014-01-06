json.videos @videos do |video|
	json.(video, :id, :title, :description)
end