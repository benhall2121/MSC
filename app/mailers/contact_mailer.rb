class ContactMailer < ActionMailer::Base
  default :from => "Website@benerino.com"
  
  def contact_email(sent_email)
    @sent_email = sent_email
    mail(:to => "benhall2121@yahoo.com", :subject => "A new message from: #{sent_email.name}")
  end
end
