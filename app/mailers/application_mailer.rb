class ApplicationMailer < ActionMailer::Base
  default from: 'marcela@theteenmagazine.com'

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: "#{user.first_name}, Welcome to The Teen Magazine!")
    mail(to: "mia@theteenmagazine.com", subject: "#{user.first_name}, Welcome to The Teen Magazine!")
  end
end
