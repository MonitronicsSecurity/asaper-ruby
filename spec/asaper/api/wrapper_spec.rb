require 'spec_helper'
require 'asaper/api/wrapper'

describe Asaper::Api::Wrapper, ".create_room" do
  let(:config) { double(:config, api_url: API_URL, api_key: API_KEY) }
  subject { described_class.new(config) }

  it "posts to /rooms with the given args" do
    args = {}
    expect(described_class).to receive(:post).with("#{API_URL}/rooms?API-KEY=#{API_KEY}", query: args) { {} }
    subject.create_room args
  end
end
