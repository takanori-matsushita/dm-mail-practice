class ApplicationMailer < ActionMailer::Base
  default from: 'dm_system@mail.com'
  
  def send_all_users(user, mail)
    @user = user
    @mail = mail
      mail(
        to: @user.email,
        subject: @mail.title,
        body: @mail.content
      )
  end
end
