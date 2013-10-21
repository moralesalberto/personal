Given(/^there are several keychains in the system$/) do
  FactoryGirl.create(:keychain, :name => 'one')
  FactoryGirl.create(:keychain, :name => 'two')
  FactoryGirl.create(:keychain, :name => 'three')
end

When(/^the user goes to the listing of keychains page$/) do
  visit(keychains_path)
end

Then(/^the list of keychains should be shown$/) do
  page.should have_content('one')
end
