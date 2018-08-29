class UserMailer < ApplicationMailer
	  default from: 'vishalsinghmar415@gmail.com'
 
  def welcome_email
     @employee = params[:employee]
    @url  = 'http://example.com/login'
    attachments['filename.png'] = File.read('/home/tester/Pictures/second.png') # to send attachments 
    email_with_name = %("#{@employee.employee_name}" <#{@employee.email}>)  # to send name along with email.. mail mai details mai to ami ja k dekhoo
    mail(to: email_with_name, subject: 'Welcome to My Awesome Site')
  end
end



 #---------for send mail first create a mailer---------#

 # rails g mailer usermailer
 #create a function in that(welcome_email)
 #install foger gem it create a application.yml in config. folder or you can use application.rb right your credintials there
  #1---if you use application.rb---- write this------------
  # config.gmail_username = "vishal.p@applify.co"   # for mailer 
    # config.gmail_password = "Vishal8277"
#2--------------if u use application.yml -----use this
#gmail_username: 'vishalsinghmar415@gmail.com'
#gmail_password: '9215330064'

#3 no go in development environment and write the below code there----------#
# ActionMailer::Base.smtp_settings = {
# :address => 'smtp.gmail.com',
# :domain => 'gmail.com',
# :port => 587,
# :user_name =>  ENV['gmail_username'],
# :password =>  ENV['gmail_password'],
# :authentication => :plain,
# :enable_starttls_auto => true
# }

#4----------------
# go to controller and write this in controller check employees controller create func .


