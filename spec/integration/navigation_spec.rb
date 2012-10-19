require 'spec_helper'

describe "Navigation" do
  include Capybara::DSL

  before do
    PassRenderer.configure do |config|
      config[:template] = File.expand_path("../../dummy/app/assets/json/pass.json.erb", __FILE__)
    end
  end

  it "should be a valid app" do
    ::Rails.application.should be_a(Dummy::Application)
  end

  it "should send pass" do
    Medication.create!(name: "synthroid", dose: 88.0, units: "mcg")
    visit pass_path(1)

    page.response_headers['Content-Transfer-Encoding'].should == 'binary'
    page.response_headers['Content-Disposition'].should == "attachment; filename=\"synthroid.pkpass\""
    page.response_headers['Content-Type'].should == "application/vnd.apple.pkpass"
  end
end
