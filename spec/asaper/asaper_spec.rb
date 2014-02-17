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
  let(:wrapper) { double(:wrapper, create_room: true) }

  before do
    allow(Asaper::Api::Wrapper).to receive(:new) { wrapper }
  end

  context "when it has a token" do
    it "calls ExistingRoom Handler" do
      expect(Asaper::Handlers::ExistingRoom).to receive(:new).with(A_ROOM_TOKEN, wrapper, &block)
      subject.room(A_ROOM_TOKEN, &block)
    end
  end

  context "when it does not have a token" do
    it "calls NewRoom Handler" do
      expect(Asaper::Handlers::NewRoom).to receive(:new).with(wrapper, &block)
      subject.room(&block)
    end
  end
end
