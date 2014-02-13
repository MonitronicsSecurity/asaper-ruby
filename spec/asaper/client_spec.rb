require 'spec_helper'
require 'asaper/client'

describe Asaper::Client do
  let(:block) { proc{ } }
  let(:room_hash) { Hash.new }
  let(:builder) { double(:builder, hash: room_hash) }

  before do
    allow(Asaper::Builders::Room).to receive(:new) { builder }
    allow(Asaper::Api::Wrapper).to receive(:create_room)
  end

  after { subject.room(&block) }

  it "creates a new room builder" do
    expect(Asaper::Builders::Room).to receive(:new).with(&block)
  end

  it "gets the hash from the created room" do
    expect(builder).to receive(:hash)
  end

  it "creates the room with the built hash" do
    expect(Asaper::Api::Wrapper).to receive(:create_room).with(room_hash)
  end
end
