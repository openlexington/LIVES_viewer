class BusinessesController < ApplicationController

  def index
    @businesses = Business.all
  end

  def show
    @business = Business.find(params[:id])
    @inspections = Inspection.where(business_id: @business.business_id)
    @violations = Violation.where(business_id: @business.business_id)
  end

  def autocomplete_business_name
    query = params[:query]

    results = Business.where("name LIKE ?", "#{query}%").limit(10)
    results.map!{|x| x['name']}
    render json: results
  end

  def search
    @query = params[:query]

    @business = Business.where("name LIKE ?", "#{@query}%").first

    if @business.nil?
      redirect_to root_path
    else
      redirect_to @business
    end
  end
end
