require 'asaper/builders/room'
describe Asaper::Builders::Room do
  let(:room_hash) { described_class.new(&block).hash }

  shared_examples_for "Room Hash" do
    it "creates the correct hash" do
      expect(room_hash).to eq(hash)
    end
  end

  context "room options" do
    it_behaves_like "Room Hash" do
      let(:block) { proc{ logo_url "url" } }
      let(:hash) { { options: { logo_url: "url" } } }
    end
  end

  context "room message" do
    it_behaves_like "Room Hash" do
      let(:block) do
        proc do
          title "Bulgary"
          subtitle "620 Davis st"
          content "Front door opened while device was armed."
        end
      end

      let(:hash) do
        {
          message: {
            title: "Bulgary",
            subtitle: "620 Davis st",
            content: "Front door opened while device was armed."
          }
        }
      end
    end
  end

  context "converts the duress" do
    it_behaves_like "Room Hash" do
      let(:block) do
        proc do
          duress "code" do
            task "message_all" do
              message "[actor_name] verified this as a false alarm"
            end
          end
        end
      end

      let(:hash) do
        {
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
        }
      end
    end
  end

  context "members" do
    it_behaves_like "Room Hash" do
      let(:block) do
        proc do
          member "Member 1", "1234", "test@email.com"
          member "Member 2", "", "test_2@email.com", "4785584433"
        end
      end

      let(:hash) do
        {
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
        }
      end
    end
  end

  context "actions" do
    it_behaves_like "Room Hash" do
      let(:block) do
        proc do
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
              password "1234"
              password_label "System Code"

              knock_in "30" do
                task "message_all" do
                  message "Activated knock"
                end
              end
            end
          end
        end
      end

      let(:hash) do
        {
          actions: [
            {
              name: "false",
              options: {
                button_color: "#fff",
                text_color: "#ccc",
                confirmation: {
                  message:"Can you verify this as a false alarm?",
                  ok_button_text: "Verify",
                  cancel_button_text: "Cancel",
                  password: "1234",
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
              },
              tasks: [
                {
                  type: "message_all",
                  options: {
                    message: "[actor_name] verified this as a false alarm"
                  }
                }
              ]
            }
          ]
        }
      end
    end
  end
end
