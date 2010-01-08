# Emailthing
module Emailthing
  
  def perform_delivery_emailthing(message)
    api_key = self.class.emailthing_settings[:api_key]
    if api_key.nil? or api_key.empty?
      raise ApiKeyMissing.new("You must provide an api key. See http://emailthing.net/help/api_key_missing for more information") 
    end
    Net::HTTP.post_form(URI.parse("http://emailthing.net/projects/#{api_key}/sent_emails"),
        :email  => message.encoded
    )
    
  end
  
  def self.api_key=(val)
    ActionMailer::Base.emailthing_settings = {:api_key=>val}
  end
  
  class ApiKeyMissing < Exception; end
  
end  
