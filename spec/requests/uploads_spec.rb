require 'spec_helper'

describe "Uploading a zip file for LIVES data import" do
  describe "success", :type => :feature do
    it "should import records from a zip file", js: true, driver: :webkit do
      visit upload_path
      page.status_code.should be(200)
      page.should have_content("Upload")
      fake_file_path = File.expand_path("#{Rails.root}/spec/fixtures/fake.zip")
      attach_file('file', fake_file_path)
      click_button('Upload')
      # expect that the upload file exists
      # expect that some records are created after import
    end
  end
end
