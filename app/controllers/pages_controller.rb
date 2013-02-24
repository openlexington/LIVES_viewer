class PagesController < ApplicationController
  def index
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
