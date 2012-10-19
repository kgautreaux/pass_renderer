require 'spec_helper'

describe PassRenderer do
  it "should be valid" do
    PassRenderer.should be_a(Module)
  end

  it  "has a mime type" do
    Mime::PKPASS.to_sym == :PKPASS
    Mime::PKPASS.to_s == "application/vnd.apple.pkpass"
  end

  it "returns a config" do
    PassRenderer.configure {}
    PassRenderer.config.should == {}
  end
end
