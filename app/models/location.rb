class Location < ApplicationRecord
  belongs_to :neighbourhood

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  def self.nearest_neighbourhood(coords)
    self.near(coords, 2, units: :km).first.neighbourhood
  end
end
