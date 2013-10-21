When(/^the user goes to view the keychain with the name "(.*?)"$/) do |name|
  keychain = Keychain.where("name = ? ",name).first
  visit(keychain_path(keychain))
end

Then(/^the show page should have a link to edit the keychain with the name "(.*?)"$/) do |name|
  keychain = Keychain.where("name = ? ",name).first
  page.html.should =~ /#{edit_keychain_path(keychain)}/
end

Then(/^the user should be shown the keychain with the name "(.*?)"$/) do |name|
  page.should have_content(name)
end

Then(/^the show page should have a link to delete the keychain with the name "(.*?)"$/) do |name|
  keychain = Keychain.where("name = ? ",name).first
  page.html.should have_selector(:xpath, "//a[@href=\"/keychains/#{keychain.id}\"]")

  possible_delete_link = page.all(:css, "a[data-method=delete]").find {|e| e.text == "Delete"}
  possible_delete_link['href'].should eq("\/keychains\/#{keychain.id}")

end
