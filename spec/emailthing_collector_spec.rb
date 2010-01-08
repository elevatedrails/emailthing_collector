require "spec_helper"

describe Emailthing do
  describe "Setup" do
  
    it "should load the delivery method" do
      ActionMailer::Base.instance_methods.should include("perform_delivery_emailthing")  
    end

    it "should allow you to fetch settings for emailthing" do
      ActionMailer::Base.emailthing_settings.should == {:api_key => nil}
    end
  
  end

  describe "execution" do
    before(:each) do
      #actionmailer makes new private
      #their initialize does nothing and doesn't call super, so this should be okay
      @mailer_instance = ActionMailer::Base.allocate
      Net::HTTP.stub!(:post_form)
      ActionMailer::Base.emailthing_settings = {:api_key=>"my_api_key"}
    end
    it "should raise an error if no api key is set" do
      ActionMailer::Base.emailthing_settings = {:api_key=>nil}
      lambda {
        @mailer_instance.perform_delivery_emailthing(TMail::Mail.new)
      }.should raise_error(Emailthing::ApiKeyMissing)
      
    end
    
    it "should post the form" do
      Net::HTTP.should_receive(:post_form).with(URI.parse("http://emailthing.net/projects/my_api_key/sent_emails"),an_instance_of(Hash))
      @mailer_instance.perform_delivery_emailthing(TMail::Mail.new)      
    end
  end
end