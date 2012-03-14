class ContactMailer < ActionMailer::Base
  include ApplicationHelper
  default :from => "Website@benerino.com"
  
  def contact_email(sent_email)
    @sent_email = sent_email
    mail(:to => emailAddress, :subject => "A new Message from: #{sent_email.name}")
  end
  
  def order_email(sent_email)
    @sent_email = sent_email
    mail(:to => emailAddress, :subject => "A new Order from: #{sent_email.name}")
  end
end
