class Business < ActiveRecord::Base
  attr_accessible :business_id, :address, :city, :latitude, :longitude, :name, :phone_number, :postal_code, :state
end
