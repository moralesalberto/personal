When(/^the user clicks on the logout link$/) do
  click_on('Logout')
end

Then(/^the user should be redirected the login page$/) do
  page.current_path.should eq('/users/sign_in')
end

Then(/^if the user attempts to go to the root page again$/) do
  visit(root_path)
end

