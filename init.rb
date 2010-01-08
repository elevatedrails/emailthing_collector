# Include hook code here

require File.dirname(__FILE__) +  "/lib/emailthing"
require "net/http"
require "action_mailer"

class ActionMailer::Base
  include Emailthing
  @@emailthing_settings = {
    :api_key => nil
  }
  cattr_accessor :emailthing_settings
end
