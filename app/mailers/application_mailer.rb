class ApplicationMailer < ActionMailer::Base
  default from: 'dm_system@mail.com'
  layout 'mailer'

  def send_dm(user, mail)
    @user = user
    @mail = mail
      mail(
        to: @user.email,
        subject: @mail.title,
      )
  end
  
  # def send_dm(addresses, mail)
  #   @addresses = addresses
  #   @mail = mail
  #     mail(
  #       to: @addresses,
  #       subject: @mail.title,
  #       body: @mail.content
  #     )
  # end

  def send_admin(admin, direct_mail)
    mail(
      to: @user.email,
      subject: @mail.title,
      body: "#{direct_mail.title} のDMを一斉送信しました"
    )
  end
end
