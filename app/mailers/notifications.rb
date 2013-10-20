class Notifications < ActionMailer::Base

  default from: 'smtpuser@moralitos.com'

  def notify_key(key) 
    @key = key
    mail(:to => 'alberto@moralitos.com', :subject => "Key shown: #{@key.name}")
  end

end
