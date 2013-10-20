When(/^the user goes to the new keychain page$/) do
  visit(new_keychain_path)
end

When(/^fills in the keychain name: "(.*?)"$/) do |keychain_name|
  fill_in('keychain_name', :with => keychain_name)
end

When(/^username: "(.*?)"$/) do |username|
  fill_in('keychain_username', :with => username)
end

When(/^password: "(.*?)"$/) do |password|
  fill_in('keychain_password', :with => password)
end

When(/^description: "(.*?)"$/) do |description|
  fill_in('keychain_description', :with => description)
end

When(/^submits the new keychain form$/) do
  click_on('Save keychain')
end

Then(/^a new keychain record is created with the name "(.*?)", and password: "(.*?)"$/) do |name, password|
  keychains = Keychain.where('name = ?', name)
  keychains.size.should eq(1)
  keychains.first.password_encrypted.should_not eq(password)
  keychains.first.password.should eq(password)
end

Then(/^the user is shown the new keychain show page$/) do
  page.current_path.should =~ /\/keychains\/(\d+)/
end

Then(/^the admin is emailed that the keychain "(.*?)" was shown to a user$/) do |name|
  emails = ActionMailer::Base.deliveries.select {|email| email.subject =~ /#{name}/}
  emails.size.should eq(1)
  emails.first.to.first.should eq('alberto@moralitos.com')
end


