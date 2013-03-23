class PagesController < ApplicationController
  def index
    @latest_scores = Inspection.latest
    @latest = @latest_scores.sort{|x,y| x.score <=> y.score}
    @offenders = @latest[0..9]
    @top = @latest.reverse[0..9]
    @average = Inspection.average(:score).round
  end

  def about
  end

  def upload
  end

  def import
    file = params[:file]
    Zip::ZipFile.open(file.tempfile) do |zipfile|
      zipfile.each do |file|
        path = Rails.root.join('tmp', 'import', file.to_s).to_s
        file.extract(path)
      end
    end
    Business.import("tmp/import/businesses.csv")
    Inspection.import("tmp/import/inspections.csv")
    Violation.import("tmp/import/violations.csv")
    redirect_to upload_path
  end
end
