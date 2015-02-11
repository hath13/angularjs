class UserMailer < ActionMailer::Base
  default from: "hath@example.com"
  def send_incoming_comment(user,comment)
    @user = user
    @comment = comment
    mail(to: @user.email,
         subject: t(:incoming_comment ,scope:[:user_mailer,:incoming_comment]))
  end
end
