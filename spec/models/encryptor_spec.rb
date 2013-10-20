require 'spec_helper'

describe Encryptor do
  it "should encrypt a string" do
    encrypted_string = Encryptor.encrypt("this string")
    encrypted_string.to_s.length.should > 0
  end

  it "should decrypt an encrypted string" do
    encrypted_string = Encryptor.encrypt("this string")
    Encryptor.decrypt(encrypted_string).should eq("this string")
  end
end
