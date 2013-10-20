class Encryptor

  def self.crypt
    secret = OpenSSL::Digest::SHA256.new(Personal::Application.config.secret).digest
    crypt = ActiveSupport::MessageEncryptor.new(secret)
  end

  def self.encrypt(string)
    encrypted_data = crypt.encrypt_and_sign(string)
  end

  def self.decrypt(encrypted_data)
    crypt.decrypt_and_verify(encrypted_data)
  end

end
