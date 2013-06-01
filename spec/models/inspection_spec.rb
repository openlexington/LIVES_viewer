require "spec_helper"

describe Inspection do
  describe 'Inspection#import should create a Inspection' do
    context "success" do
      let(:fake_path) { File.expand_path("#{Rails.root}/spec/fixtures/inspections.csv") }
      it "should create an inspection from CSV" do
        ins = Fabricate.build(:inspection) do
          id 1
          business_id 1234
          date 20120412
          description "dunno"
          score 96
        end

        Inspection.import(fake_path)

        expect(Inspection.all).to include(ins)
      end
    end
  end
end
