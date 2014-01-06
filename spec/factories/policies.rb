# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :policy do
  	# video build(:video)
  	# country_code build(:county_code)
  	policy_code Policy::POLICY_CODES.sample
  end
end
