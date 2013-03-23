class Business < ActiveRecord::Base
  attr_accessible :address, :city, :latitude, :longitude, :name, :phone_number, :postal_code, :state
  has_many :inspections
  has_many :violations

  def self.import(path)
    CSV.foreach(path, headers: true, header_converters: :symbol) do |entry|
      if entry[:business_id] != '#N/A'
        business = find_by_id(entry[:business_id]) || new
        business.id = entry[:business_id]
        business.name = entry[:name]
        business.address = entry[:address]
        business.city = entry[:city]
        business.state = entry[:state]
        business.save!
      end
    end
  end
end
