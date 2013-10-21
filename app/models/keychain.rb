class Keychain < ActiveRecord::Base
  
  validates_uniqueness_of :name

  def password=(string)
    self.password_encrypted = Encryptor.encrypt(string)
  end

  def password
    password_encrypted.blank? ? '' : Encryptor.decrypt(password_encrypted.to_s)
  end

end
