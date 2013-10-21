FactoryGirl.define do
  factory :user do|f|
    f.email 'someuser@somecompany.com'
    f.password 'somepassword'
  end
end

FactoryGirl.define do
  factory :keychain do |f|
    f.name 'name'
    f.password 'thepass'
    f.description 'description here'
    f.username 'theusername'
  end
end
