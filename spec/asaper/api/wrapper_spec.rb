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

describe Asaper::Api::Wrapper, ".new_message" do
  let(:config) { double(:config, api_url: API_URL, api_key: API_KEY) }
  subject { described_class.new(config) }

  it "posts to /rooms/alarm_messages with the given args" do
    args = {}
    expect(described_class).to receive(:post).with("#{API_URL}/rooms/#{A_ROOM_TOKEN}/alarm_messages?API-KEY=#{API_KEY}", query: args) { {} }
    subject.new_message A_ROOM_TOKEN, args
  end
end

describe Asaper::Api::Wrapper, ".new_member_message" do
  let(:config) { double(:config, api_url: API_URL, api_key: API_KEY) }
  subject { described_class.new(config) }

  it "posts to /rooms/alarm_messages with the given args" do
    args = {}
    expect(described_class).to receive(:post).with("#{API_URL}/rooms/#{A_ROOM_TOKEN}/messages?API-KEY=#{API_KEY}", query: args) { {} }
    subject.new_member_message A_ROOM_TOKEN, args
  end
end

describe Asaper::Api::Wrapper, ".account_info" do
  let(:config) { double(:config, api_url: API_URL, api_key: API_KEY) }
  subject { described_class.new(config) }

  it "gets rooms/account_info" do
    expect(described_class).to receive(:get).with("#{API_URL}/rooms/#{A_ROOM_TOKEN}/account_info?API-KEY=#{API_KEY}") { {} }
    subject.account_info A_ROOM_TOKEN
  end
end

describe Asaper::Api::Wrapper, ".resolve_room" do
  let(:config) { double(:config, api_url: API_URL, api_key: API_KEY) }
  subject { described_class.new(config) }

  it "puts to /rooms/resolve with the given args" do
    args = {}
    expect(described_class).to receive(:put).with("#{API_URL}/rooms/#{A_ROOM_TOKEN}/resolve?API-KEY=#{API_KEY}", query: args) { {} }
    subject.resolve_room A_ROOM_TOKEN, args
  end
end
