class Violation < ActiveRecord::Base
  attr_accessible :business_id, :code, :date, :description
  belongs_to :business

  def self.import(path)
    CSV.foreach(path, headers: true, header_converters: :symbol) do |entry|
      if entry[:business_id] != '#N/A'
        violation = Violation.new()
        violation.business_id = entry[:business_id]
        violation.date = entry[:date]
        violation.code = entry[:code]
        violation.description = entry[:description]
        violation.save!
      end
    end
  end

  def inspection
    Inspection.where(business_id: business_id, date: date).first
  end
end
