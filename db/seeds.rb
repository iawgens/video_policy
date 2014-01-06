country_codes = CountryCode.create(
	[
		{name: 'United States', iso_code: 'US'},
		{name: 'Canada', iso_code: 'CA'},
		{name: 'Mexico', iso_code: 'MX'},
		{name: 'China', iso_code: 'CN'},
		{name: 'Taiwan', iso_code: 'IN'}
	]
)

(00..99).each do |i|
	video = Video.create({title: "VID#{"%02d" % i}", description: "Description for VID#{"%02d" % i}"})
	country_codes.each do |country_code|
		policy_code = Policy::POLICY_CODES.sample
		video.policies.create(country_code_id: country_code.id, policy_code: policy_code)
	end
end