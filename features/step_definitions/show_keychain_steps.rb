When(/^the user goes to view the keychain with the name "(.*?)"$/) do |name|
  keychain = Keychain.where("name = ? ",name).first
  visit(keychain_path(keychain))
end

Then(/^the show page should have a link to edit the keychain with the name "(.*?)"$/) do |name|
  keychain = Keychain.where("name = ? ",name).first
  page.html.should =~ /#{edit_keychain_path(keychain)}/
end
