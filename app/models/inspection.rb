class Inspection < ActiveRecord::Base
  attr_accessible :business_id, :date, :description, :score, :type
end
