require 'spec_helper'
require 'asaper/client'

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

  it "converts the members" do
    room_hash = subject.room do
      member "Member 1", "1234", "test@email.com"
      member "Member 2", "", "test_2@email.com", "4785584433"
    end

    expect(room_hash).to eq(
      members: [
        {
          name: "Member 1",
          pin: "1234",
          contact_methods: [ "test@email.com" ]
        },
        {
          name: "Member 2",
          pin: "",
          contact_methods: [ "test_2@email.com", "4785584433" ]
        }
      ]
    )
  end

  it "converts the actions" do
    room_hash = subject.room do
      action "false" do
        button_color "#fff"
        text_color "#ccc"

        task "message_all" do
          message "[actor_name] verified this as a false alarm"
        end

        confirmation do
          message "Can you verify this as a false alarm?"
          ok_button_text "Verify"
          cancel_button_text "Cancel"
          passwords "1234", "1235"
          password_label "System Code"

          knock_in "30" do
            task "message_all" do
              message "Activated knock"
            end
          end
        end
      end
    end

    expect(room_hash).to eq(
      actions: [
        {
          name: "false",
          options: {
            button_color: "#fff",
            text_color: "#ccc"
          },
          tasks: [
            {
              type: "message_all",
              options: {
                message: "[actor_name] verified this as a false alarm"
              }
            }
          ],

          confirmation: {
            message:"Can you verify this as a false alarm?",
            ok_button_text: "Verify",
            cancel_button_text: "Cancel",
            passwords: ["1234", "1235"],
            password_label: "System Code",

            knock: {
              run_in: "30",
              tasks: [
                {
                  type: "message_all",
                  options: {
                    message: "Activated knock"
                  }
                }
              ]
            }
          }
        }
      ]
    )
  end
end
