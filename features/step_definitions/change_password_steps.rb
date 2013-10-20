When(/^the user goes to the change password page$/) do
  visit(edit_user_path)
end

When(/^fills in current password: "(.*?)", new password: "(.*?)", and new password confirmation "(.*?)"$/)  do |current_password, new_password, new_password_confirmation|
  fill_in('user_current_password', :with => current_password)
  fill_in('user_password', :with => new_password)
  fill_in('user_password_confirmation', :with => new_password_confirmation)
end

When(/^submits the change password form$/) do
  click_on('Change Password')
end

Then(/^the user should be shown the error "(.*?)"$/) do |error_message|
  page.should have_content(error_message)
end

Then(/^sent back to the change password form$/) do
  page.html.should have_selector(:xpath, '//form[@action="/user/update_password"]')
  page.html.should have_selector(:xpath, '//form[@method="post"]')
end
