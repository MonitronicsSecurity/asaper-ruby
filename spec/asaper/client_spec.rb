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

    expect(room_hash).to eq(
      message: {
        title: "Bulgary",
        subtitle: "620 Davis st",
        content: "Front door opened while device was armed."
      }
    )
  end

  it "converts the duress" do
    room_hash = subject.room do
      duress "code" do
        task "message_all" do
          message "[actor_name] verified this as a false alarm"
        end
      end
    end

    expect(room_hash).to eq(
      duress: {
        code: "code",
        tasks:
        [
          {
            type: "message_all",
            options: {
              message: "[actor_name] verified this as a false alarm"
            }
          }
        ]
      }
    )
  end
end
