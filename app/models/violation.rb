class Violation < ActiveRecord::Base
  attr_accessible :business_id, :code, :date, :description
end
