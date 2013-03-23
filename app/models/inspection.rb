class Inspection < ActiveRecord::Base
  attr_accessible :business_id, :date, :description, :score, :type
  belongs_to :business

  default_scope order('date DESC')

  def self.import(path)
    CSV.foreach(path, headers: true, header_converters: :symbol) do |entry|
      if entry[:business_id] != '#N/A'
        inspection = Inspection.find_by_date(entry[:date]) || new
        inspection.business_id = entry[:business_id]
        inspection.score = entry[:score]
        inspection.date = entry[:date]
        inspection.save!
      end
    end
  end

  def self.latest
    Inspection.all.uniq{|i| i.business_id}
  end
  def violations
    Violation.where(business_id: business_id, date: date)
  end

end
