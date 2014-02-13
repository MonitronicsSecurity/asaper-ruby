asaper-ruby
===========

Set the api key

```ruby
  Asaper.configure do |config|
    config.api_key = API_KEY
  end
```

```ruby
room do
  logo_url "url"
  title "title Bulglary"
  subtitle "subtitle 620 Davis"
  content "content bla"
  
  task "message_all" do
    message "message to display"
  end
  
  duress "code" do
    task "message_all" do
      message "[actor_name] verified this as a false alarm"
    end
  end
  
  member "name", "pin", "contact_method_1", "contact_method 2"
  member "name", "pin", "contact_method_1", "contact_method 2"
  member "name", "pin", "contact_method_1", "contact_method 2"
  
  action "false" do
    button_color "hey there"
    text_color "hey there"
    
    confirmation do
      message "Can you verify this as a false alarm?"
      ok_button_text "Verify"
      cancel_button_text "Cancel"
      passwords "1234", "1235"
      password_label "System Code"
      
      knock_in "30" do
        task "message_all" do
          message "Esoooooo"
        end
      end
    end
  end
end
```
