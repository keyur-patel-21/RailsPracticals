class UserMailer < ApplicationMailer

  def welcome_email(usern)
    @usern = usern
    mail(to: @usern.email, subject: 'Welcome to My Awesome Site')
  end
end
