FactoryGirl.define do
  factory :user do|f|
    f.email 'someuser@somecompany.com'
    f.password 'somepassword'
  end
end
