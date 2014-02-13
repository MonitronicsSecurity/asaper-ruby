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

describe Asaper, ".room" do
  let(:block) { proc{ } }
  let(:room_hash) { Hash.new }
  let(:builder) { double(:builder, hash: room_hash) }
  let(:wrapper) { double(:wrapper, create_room: true) }

  before do
    allow(Asaper::Builders::Room).to receive(:new) { builder }
    allow(Asaper::Api::Wrapper).to receive(:new) { wrapper }
  end

  after { subject.room(&block) }

  it "creates a new room builder" do
    expect(Asaper::Builders::Room).to receive(:new).with(&block)
  end

  it "gets the hash" do
    expect(builder).to receive(:hash)
  end

  it "creates the api wrapper" do
    expect(Asaper::Api::Wrapper).to receive(:new).with(Asaper.configuration)
  end

  it "creates the room" do
    expect(wrapper).to receive(:create_room).with(room_hash)
  end
end
