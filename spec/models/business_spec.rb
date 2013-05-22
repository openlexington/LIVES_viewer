require "spec_helper"

describe Business do
  describe 'Business#import should create a business' do
    context "success" do
      let(:fake_path) { File.expand_path("#{Rails.root}/spec/fixtures/businesses.csv") }
      it "should create a business from CSV" do
        biz = Fabricate.build(:business) do
          id 1234
          name 'LFUCG'
          address '200 E Main'
          city 'Lexington'
          state 'KY'
          phone_number '859-555-1212'
          postal_code '40508'
        end

        Business.import(fake_path)

        expect(Business.all).to include(biz)
      end
    end
  end
end
