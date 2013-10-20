
Given(/^a user is not logged in$/) do
  #nothing to do
end

When(/^the user goes to the root page of the application$/) do
  visit(root_path)
end

Then(/^the user should be redirected to the login page$/) do
  page.current_path.should eq('/users/sign_in')
end

And(/^is a valid user with email "(.*?)" and password "(.*?)"$/) do |email, password|
  user = FactoryGirl.create(:user, :email => email, :password => password)
end

When(/^the user enters his correct credentials in the login page, email: "(.*?)" and password "(.*?)"$/) do |email, password|
  fill_in('user_email', :with => email)
  fill_in('user_password', :with => password)
end

When(/^the user enters the incorrect password in the login page, email: "(.*?)" and password "(.*?)"$/) do |email, password|
  fill_in('user_email', :with => 'someuser@somecompany.com')
  fill_in('user_password', :with => "#{password}1234" )
end

When(/^the user enters the incorrect email in the login page, email: "(.*?)" and password "(.*?)"$/) do |email, password|
  fill_in('user_email', :with => "wrong#{email}")
  fill_in('user_password', :with => password)
end

And(/^submits the login page$/) do
  click_on('Sign in')
end

Then(/^the user should be shown the root page$/) do
  page.current_path.should eq(root_path)
end
