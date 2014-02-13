require 'spec_helper'

describe Asaper::Configuration do
  it "has an api_key" do
    api_key = "1234bcd"
    subject.api_key = api_key
    expect(subject.api_key).to eq api_key
  end
end
