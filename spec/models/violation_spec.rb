require "spec_helper"

describe Violation do
  describe 'Violation#import should create a violation' do
    context "success" do
      let(:fake_path) { File.expand_path("#{Rails.root}/spec/fixtures/violations.csv") }
      it "should create an violation from CSV" do
        vio = Fabricate(:violation) do
          business_id 1234
          code 19
          date 20120412
          description "FOOD EQUIPMENT & UTENSILS: Food/Non-food contact surfaces of equip/utensils clean"
        end

        Violation.import(fake_path)

        expect(Violation.all).to include(vio)
      end
    end
  end
end
