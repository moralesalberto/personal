
Given(/^a user is not logged in$/) do
  #nothing to do
end

When(/^the user goes to the root page of the application$/) do
  visit(root_path)
end

Then(/^the user should be redirected to the login page$/) do
  page.current_path.should eq('/users/sign_in')
end

When(/^the user enters his correct credentials in the login page$/) do
  user = FactoryGirl.create(:user, :email => 'someuser@somecompany.com', :password => 'somepassword')
  fill_in('user_email', :with => 'someuser@somecompany.com')
  fill_in('user_password', :with => 'somepassword')
end

When(/^the user enters the incorrect password in the login page$/) do
  user = FactoryGirl.create(:user, :email => 'someuser@somecompany.com', :password => 'somepassword')
  fill_in('user_email', :with => 'someuser@somecompany.com')
  fill_in('user_password', :with => 'incorrectpassword')
end

When(/^the user enters the incorrect email in the login page$/) do
  user = FactoryGirl.create(:user, :email => 'someuser@somecompany.com', :password => 'somepassword')
  fill_in('user_email', :with => 'someincorrectuser@somecompany.com')
  fill_in('user_password', :with => 'somepassword')
end

And(/^submits the login page$/) do
  click_on('Sign in')
end

Then(/^the user should be shown the root page$/) do
  page.current_path.should eq(root_path)
end
