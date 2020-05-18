class ApplicationMailer < ActionMailer::Base
  default from: 'dm_system@mail.com'
  
  def send_dm(addresses, mail)
    @addresses = addresses
    @mail = mail
      mail(
        to: @addresses,
        subject: @mail.title,
        body: @mail.content
      )
  end
end
