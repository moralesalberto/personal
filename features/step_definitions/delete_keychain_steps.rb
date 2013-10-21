When(/^the user clicks on the delete keychain link$/) do
  click_on('Delete')
end

Then(/^the keychain with the name "(.*?)" should be deleted$/) do |name|
  keychains = Keychain.where('name = ?', name)
  keychains.size.should eq(0)
end
