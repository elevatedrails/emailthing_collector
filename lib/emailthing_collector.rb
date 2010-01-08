# EmailthingCollector
module EmailthingCollector
  def deliver!(message=@mail)
    return_value = super(message)
    puts "Called superclass!"
    if defined? EMAILTHING_API_KEY and !message.message_id.blank?
      Net::HTTP.post_form(URI.parse("http://emailthing.net/projects/#{EMAILTHING_API_KEY}/sent_emails"),
          :smtp_message_id  => message.message_id,
          :from_address => message.from.first,
          :subject => message.subject
      )
    end
    return_value
  end
end  
