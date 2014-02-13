require 'spec_helper'
require 'asaper/api/wrapper'

describe Asaper::Api::Wrapper do
  subject { described_class }
  its(:base_uri) { should == "https://api.asaper-staging.com/api/v1" }
end

describe Asaper::Api::Wrapper, ".create_room" do
  it "posts to /rooms with the given args" do
    args = {}
    expect(described_class).to receive(:post).with("/rooms?API-KEY=#{API_KEY}", query: args) { {} }
    described_class.create_room args
  end
end
