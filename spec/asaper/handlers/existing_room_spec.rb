require 'spec_helper'
require 'asaper/handlers/existing_room'

describe Asaper::Handlers::ExistingRoom, "#message" do
  let(:api_wrapper) { double(:api_wrapper) }

  it "tells api wrapper to send a new message" do
    message = "We are trying to contact a member from the call list"
    expect(api_wrapper).to receive(:new_message).with(A_ROOM_TOKEN, message: { content: message } )
    described_class.new(A_ROOM_TOKEN, api_wrapper) do |room|
      room.message message
    end
  end
end

describe Asaper::Handlers::ExistingRoom, "#resolve" do
  let(:api_wrapper) { double(:api_wrapper) }

  it "tells api wrapper to resolve the room" do
    message = "Room got resolved"
    expect(api_wrapper).to receive(:resolve_room).with(A_ROOM_TOKEN, message: message)
    described_class.new(A_ROOM_TOKEN, api_wrapper) do |room|
      room.resolve message
    end
  end
end

describe Asaper::Handlers::ExistingRoom, "#account_info" do
  let(:api_wrapper) { double(:api_wrapper) }

  it "tells api wrapper to get the account info of the room" do
    expect(api_wrapper).to receive(:account_info).with(A_ROOM_TOKEN)
    described_class.new(A_ROOM_TOKEN, api_wrapper) do |room|
      room.account_info
    end
  end
end
