class Business < ActiveRecord::Base
  attr_accessible :business_id, :address, :city, :latitude, :longitude, :name, 
                  :phone_number, :postal_code, :state

  def self.import(path)
    CSV.foreach(path, headers: true, header_converters: :symbol) do |entry|
      business = find_by_business_id(entry[:business_id]) || new
      business.business_id = entry[:business_id]
      business.name = entry[:name]
      business.address = entry[:address]
      business.city = entry[:city]
      business.state = entry[:state]
      business.save!
      business
    end
  end
end
