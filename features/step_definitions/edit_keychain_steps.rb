Given(/^an existing keychain with name "(.*?)"$/) do |name|
  FactoryGirl.create(:keychain, :name => name)
  keychains = Keychain.where("name = ?", name)
  keychains.size.should eq(1)
end

Given(/^another existing keychaing with the name "(.*?)"$/) do |name|
  FactoryGirl.create(:keychain, :name => name)
  keychains = Keychain.where("name = ?", name)
  keychains.size.should eq(1)
end

When(/^the user goes to the edit keychain with the name "(.*?)"$/) do |name|
  keychains = Keychain.where("name = ?", name)
  visit(edit_keychain_path(keychains.first))
end

When(/^fills in the name of the keychain to "(.*?)"$/) do |name|
  fill_in('keychain_name', :with => name)
end

When(/^submits the keychain edit form$/) do
  click_on('Save keychain')
end

Then(/^the keychain record should be updated with the name "(.*?)"$/) do |name|
  Keychain.first.name.should eq(name)
end

Then(/^the user should be shown an error "(.*?)"$/) do |error|
  page.should have_content(error)
end

Then(/^should be shown the edit page again$/) do
  page.current_path.should =~ /\/keychains\/(\d+)/
end
