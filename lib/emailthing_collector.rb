# EmailthingCollector
module EmailthingCollector
  
  def perform_delivery_emailthing(message)
    if defined? EMAILTHING_API_KEY and !message.message_id.blank?
      Net::HTTP.post_form(URI.parse("http://emailthing.net/projects/#{EMAILTHING_API_KEY}/sent_emails"),
          :smtp_message_id  => message.message_id,
          :from_address => message.from.first,
          :subject => message.subject
      )
    end
    
  end
end  
