class CountryCode < ActiveRecord::Base
  attr_accessible :iso_code, :name

  has_many :policies
  has_many :videos, through: :policies
end
