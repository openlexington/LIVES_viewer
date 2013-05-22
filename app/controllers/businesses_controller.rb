class BusinessesController < ApplicationController

  def index
    @businesses = Business.all
  end

  def show
    @business = Business.find(params[:id])
  end

  def autocomplete_business_name
    query = params[:query]

    results = Business.where("name LIKE ?", "#{query}%").limit(10)
    results.map!{|x| x['name']}
    render json: results
  end

  def chart
    @business = Business.where(id: params[:id])
    if @business.empty?
      data = []
    else
      @business = @business.first
      dates = @business.inspections.reverse.map{|x| x.date}
      scores = @business.inspections.reverse.map{|x| x.score}
      data = { labels: dates, datasets: [{
        fillColor: "rgba(151,187,205,0.5)",
        strokeColor: "rgba(151,187,205,1)",
        pointColor: "rgba(151,187,205,1)",
        pointStrokeColor: "#fff",
        data: scores
        }]}
    end
    render json: data
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
