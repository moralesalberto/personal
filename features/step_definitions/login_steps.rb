Given(/^a user not logged in$/) do
  
end

When(/^the user attempts to go to the root page of the application$/) do
  visit(root_path)
end

Then(/^the user should be redirected to the login page$/) do
  page.current_path.should eq('/users/sign_in')
end
