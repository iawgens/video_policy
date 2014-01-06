class Policy < ActiveRecord::Base
  attr_accessible :country_code_id, :policy_code, :video_id

  belongs_to :video
  belongs_to :country_code

  POLICY_CODES = ['monetize', 'free', 'block']
  
end
