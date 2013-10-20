class Keychain < ActiveRecord::Base
  



  def password=(string)
    self.password_encrypted = Encryptor.encrypt(string)
  end

  def password
    password_encrypted.blank? ? '' : Encryptor.decrypt(password_encrypted.to_s)
  end

end
