class Video < ActiveRecord::Base
  attr_accessible :asset_id, :description, :title

  has_many :policies

  def self.in_countries(iso_codes)
  	joins(:policies => :country_code).where(["country_codes.iso_code IN (?)", iso_codes])
  end

  def self.with_policy(policy_codes)
  	joins(:policies).where(["policies.policy_code IN (?)", policy_codes])
  end

  def self.filter(options={})
  	query = includes(:policies => :country_code)

  	if id = options[:id]
  		query = query.where(id: id)
  	end

  	if country_code = options[:country_code]
  		query = query.in_countries(country_code)
  	end

  	if policy_codes = options[:policy_codes]
  		query = query.with_policy(policy_codes)
  	end

  	return query
  end

end
