require 'spec_helper'

describe "Uploading a zip file for LIVES data import" do
  describe "success", :type => :feature do
    it "should import records from a zip file", driver: :webkit do
      visit upload_path
      page.status_code.should be(200)
      page.should have_content("Upload")
      fake_file_path = File.expand_path("#{Rails.root}/spec/fixtures/fake.zip")
      attach_file('file', fake_file_path)
      click_button('Upload')
      # expect that the upload file exists
      upload_path = File.expand_path("#{Rails.root}/tmp/import/")
      expect(Dir.entries(upload_path)).to include("businesses.csv")
      expect(Dir.entries(upload_path)).to include("violations.csv")
      expect(Dir.entries(upload_path)).to include("inspections.csv")
      # expect that some records are created after import
      visit business_path(1234)
      page.should have_content("LFUCG")
    end
  end
end
