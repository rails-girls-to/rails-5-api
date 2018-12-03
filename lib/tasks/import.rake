namespace :import do

  desc "import neighbourhoods from CSV"
  task neighbourhood: :environment do
    require 'csv'
    CSV.foreach('lib/neighbourhoods.csv', headers: true) do |row|
      neighbourhood = Neighbourhood.find_or_create_by(name: row['name'])
      neighbourhood.update_attributes(row.to_h)
    end
  end

  desc "import locations from CSV"
  task location: :environment do
    require 'csv'
    CSV.foreach('lib/locations.csv', headers: true) do |row|
      neighbourhood_id = Neighbourhood.find_by(name: row['neighbourhood']).id
      location = Location.find_or_create_by(neighbourhood_id: neighbourhood_id)
      location.update_attributes(row.to_h.slice('latitude', 'longitude'))
    end
  end

end
