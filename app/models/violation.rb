class Violation < ActiveRecord::Base
  attr_accessible :business_id, :code, :date, :description

  def self.import(path)
    CSV.foreach(path, headers: true, header_converters: :symbol) do |entry|
      violation = Violation.find_by_date(entry[:date]) || new
      violation.business_id = entry[:business_id]
      violation.date = entry[:date]
      violation.code = entry[:code]
      violation.description = entry[:description]
      violation.save!
    end
  end
end
