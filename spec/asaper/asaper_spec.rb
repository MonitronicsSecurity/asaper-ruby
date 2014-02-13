require 'spec_helper'

describe Asaper, ".configure" do
  let(:api_key) { "12345bcd" }

  it "configures api_key" do
    Asaper.configure do |config|
      config.api_key = api_key
    end

    expect(Asaper.configuration.api_key).to eq api_key
  end
end
