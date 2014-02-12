require 'spec_helper'
describe Asaper::Client do
  it "converts room options" do
    room_hash = subject.room do
      logo_url "url"
    end

    expect(room_hash).to eq({ options: { logo_url: "url" } })
  end

  it "converts room message" do
    room_hash = subject.room do
      title "Bulgary"
      subtitle "620 Davis st"
      content "Front door opened while device was armed."
    end

    expect(room_hash).to eq({
      message: {
        title: "Bulgary",
        subtitle: "620 Davis st",
        content: "Front door opened while device was armed."
      }
    })
  end
end
