Given(/^there are several keychains in the system, with names "(.*?)"$/) do |names|
  names = names.split(",").map {|name| name.strip}
  names.each do |name|
    FactoryGirl.create(:keychain, :name => name)
  end
end

When(/^the user goes to the listing of keychains page$/) do
  visit(keychains_path)
end

Then(/^the keychains listing page is presented$/) do
  page.current_path.should eq(keychains_path)
end

Then(/^the list of keychains should be shown, with names "(.*?)"$/) do |names|
  names = names.split(",").map {|name| name.strip}
  names.each do |name|
    page.should have_content(name)
  end
end
