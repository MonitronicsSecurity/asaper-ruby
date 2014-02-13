require 'spec_helper'

describe "Full Spec" do
  before do
    Asaper.configure do |config|
      config.api_key = "FbFSdA0is_oHtTVUfT1_kw"
      config.api_env = :staging
    end
  end

  it "sends the test" do
    pending "Running this test will send and ASAP, be careful"
    Asaper.room do
      logo_url "http://pernix-solutions.com/images/logo-3.png"
      title "Testing asaper"
      subtitle "Pernix CR"
      content "This is just a test for dsl"

      duress "duck" do
        task "message_all" do
          message "[actor_name] has activated the duress"
        end
      end

      member "Jose Andres", "1234", "jalvarez@pernix.cr"
      member "Esteban Soto", "123456", "esoto@pernix.cr"
      member "Cesar Navarro", "12345", "cnavarro@pernix.cr"

      action "false" do
        button_color "#00cb38"
        text_color "#fff"
        icon "alarm"
        icon_color "#fff"

        task "message_all" do
          message "[actor_name] pressed false alarm"
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
end
