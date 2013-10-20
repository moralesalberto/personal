Given(/^a user that forgot his password$/) do
  #nothing here
end

When(/^the user goes to the forgot password page$/) do
  visit(new_user_password_path)
end

When(/^the user fills in his email: "(.*?)" in the forgot password form$/) do |email|
  fill_in('user_email', :with => email)
  click_on('Send me reset password instructions')
end

Then(/^the user should receive an email with a reset link$/) do
  user = User.first
  @matching_emails = ActionMailer::Base.deliveries.select {|email| email.to.first == user.email and email.subject =~ /Reset password instructions/}
  @matching_emails.size.should eq(1)
end


When(/^the user goes to the reset link from the email$/) do
  html = Nokogiri::HTML(@matching_emails.first.body.to_s)
  link = html.css('a').select {|link| link['href'] =~ /reset_password/}.first
  visit(link['href'])
end

Then(/^user should be presented with a reset your password form$/) do
  page.html.should have_selector(:xpath, '//form[@action="/users/password"]')
  page.html.should have_selector(:xpath, '//form[@method="post"]')
end


When(/^the user fills in the new password: "(.*?)" and submits the forgot password form$/) do |new_password|
  fill_in('user_password_confirmation', :with => new_password)
  fill_in('user_password', :with => new_password)
  click_on('Change my password')
  puts page.html

end

