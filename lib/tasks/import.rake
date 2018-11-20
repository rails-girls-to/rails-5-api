namespace :import do

  desc "import neighbourhoods from CSV"
  task neighbourhood: :environment do
    require 'csv'
    CSV.foreach('tmp/neighbourhoods.csv', headers: true) do |row|
      neighbourhood = Neighbourhood.find_or_create_by(name: row['name'])
      neighbourhood.update_attributes(row.to_h)
      printf("\r %s", [':)', ':O', ':P', ':D', ':/'].sample)
    end
  end

  desc "import locations from CSV"
  task location: :environment do
    require 'csv'
    CSV.foreach('tmp/locations.csv', headers: true) do |row|
      neighbourhood_id = Neighbourhood.find_by(name: row['neighbourhood']).id
      location = Location.find_or_create_by(neighbourhood_id: neighbourhood_id)
      location.update_attributes(row.to_h.slice('latitude', 'longitude'))
      printf("\r %s", [':)', ':O', ':P', ':D', ':/'].sample)
    end
  end

end
