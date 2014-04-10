require 'spec_helper'

describe "Full Spec" do
  before do
    Asaper.configure do |config|
      config.api_key = "FbFSdA0is_oHtTVUfT1_kw"
      config.api_env = :staging
    end
  end

  it "activates the members" do
    pending "Running this test will activate a member, be careful"
    Asaper.room("mP03YuYMasbiDMAdDAdvhQ") do |room|
      room.activate_member 1740
    end
  end

  it "sends the test" do
    pending "Running this test will send and ASAP, be careful"
    Asaper.room do |r|
      r.logo_url "http://pernix-solutions.com/images/logo-3.png"
      r.title "Testing asaper"
      r.subtitle "Pernix CR"
      r.content "This is just a test for dsl"

      r.duress "duck" do |d|
        d.task "message_all" do |t|
          t.message "[actor_name] has activated the duress"
        end
      end

      r.member do |m|
        m.name "Cesar Navarro"
        m.pin "1234"
        m.contact_methods "cnavarro@pernix.cr"
        m.owner true
      end

      r.action "false" do |a|
        a.button_color "#00cb38"
        a.text_color "#fff"
        a.icon "alarm"
        a.icon_color "#fff"

        a.task "message_all" do |t|
          t.message "[actor_name] pressed false alarm"
        end

        a.confirmation do |c|
          c.message "Can you verify this as a false alarm?"
          c.ok_button_text "Verify"
          c.cancel_button_text "Cancel"
          c.passwords "1234"
          c.password_label "System Code"

          c.knock_in "30" do |k|
            k.task "message_all" do |t|
              t.message "Activated knock"
            end
          end
        end
      end
    end
  end
end
