require 'spec_helper'

describe Asaper, ".configure" do
  before do
    Asaper.configure do |config|
      config.api_key = API_KEY
      config.api_env = :production
    end
  end

  it "configures api_key" do
    expect(Asaper.configuration.api_key).to eq API_KEY
  end

  it "configures api_url" do
    expect(Asaper.configuration.api_url).to eq "https://api.asaper.com/api/v1"
  end
end
