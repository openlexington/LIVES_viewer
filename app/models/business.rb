class Business < ActiveRecord::Base
  attr_accessible :address, :city, :latitude, :longitude, :name, :phone_number, :postal_code, :state
  has_many :inspections
  has_many :violations

  def self.import(path)
    CSV.foreach(path, headers: true, header_converters: :symbol) do |entry|
      if entry[:business_id] != '#N/A'
        business = Business.where(id: entry[:business_id]).first_or_initialize
        business.id = entry[:business_id]
        business.name = entry[:name]
        business.address = entry[:address]
        business.city = entry[:city]
        business.state = entry[:state]
        business.save!
      end
    end
  end

  # Gets the score of the latest inspection
  def latest_score
    # If the last two inspections happened on the same day, get the highest score
    # This is just some heuristics due to Lexington not having a way to see
    # which score was a follow up.
    if inspections.first.date == inspections[1].date
      # Maybe add an asterix or something to the end, showing that it was a (assumed) followup
      [inspections.first, inspections[1]].sort{|x,y| x.score <=> y.score}.last.score
    else
      inspection.first.score
    end
  end
end
