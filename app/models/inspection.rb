class Inspection < ActiveRecord::Base
  attr_accessible :business_id, :date, :description, :score, :type

  def self.import(path)
    CSV.foreach(path, headers: true, header_converters: :symbol) do |entry|
      inspection = Inspection.find_by_date(entry[:date]) || new
      inspection.business_id = entry[:business_id]
      inspection.score = entry[:score]
      inspection.date = entry[:date]
      inspection.save!
    end
  end
end
