require 'asaper/handlers/new_room'

describe Asaper::Handlers::NewRoom, ".initialize" do
  let(:room_hash) { Hash.new }
  let(:block) { proc{ } }
  let(:wrapper) { double(:wrapper, create_room: true) }
  let(:builder) { double(:builder, hash: room_hash) }

  before { allow(Asaper::Builders::Room).to receive(:new) { builder } }

  after { described_class.new(wrapper, &block) }

  it "creates a new room builder" do
    expect(Asaper::Builders::Room).to receive(:new)
  end

  it "gets the hash" do
    expect(builder).to receive(:hash)
  end

  it "creates the room" do
    expect(wrapper).to receive(:create_room).with(room_hash)
  end
end
