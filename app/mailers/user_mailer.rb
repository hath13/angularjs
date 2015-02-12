class UserMailer < ActionMailer::Base
 
  def send_incoming_comment(user,comment)
    @user = user
    @comment = comment
    mail(from: @user.email,to: @user.email,
         subject: t(:incoming_comment ,scope:[:user_mailer,:incoming_comment]))
  end
  def send_email(email,user)
    @user = user
    @email = email
    mail(from: @user.email, to: @email.to,
         subject: "@email.title")
  end
end
