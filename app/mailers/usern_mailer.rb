class UsernMailer < ApplicationMailer

  default from: 'notifications@example.com'

  def welcome_email
    @usern = params[:usern]
    @url = 'http://example.com/login'
    mail(to: @usern.email, subject: 'Welcome to My Awesome Site')
  end

  def email_alter
    @usern = params[:usern]
    mail(to: @usern.email, subject:"Your email has been altered")
  end
end
