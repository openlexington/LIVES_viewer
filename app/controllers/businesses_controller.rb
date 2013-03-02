class BusinessesController < ApplicationController

  def index
    @businesses = Business.all
  end

  def show
    @business = Business.find(params[:id])
    @inspections = Inspection.where(business_id: @business.business_id)
    @violations = Violation.where(business_id: @business.business_id)
  end
end
