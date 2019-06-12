class ApplicationMailer < ActionMailer::Base
  default from: 'theteenmagazineeditors@gmail.com'

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: "#{user.first_name}, Welcome to The Teen Magazine!")
  end
end
