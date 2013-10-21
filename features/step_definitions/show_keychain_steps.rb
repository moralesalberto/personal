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

  # this one is too ambiguous
  page.html.should have_selector(:xpath, "//a[@href=\"/keychains/#{keychain.id}\"]", :text => "Delete")

  #one way to do this using xpath
  delete_links_via_xpath = page.all(:xpath, "//a[@href=\"/keychains/#{keychain.id}\"]", :text => "Delete")
  delete_links_via_xpath.select {|link| link['data-method' == 'delete']}
  delete_links_via_xpath.size.should > 0

  # another way, using css 
  delete_links = page.all(:css, "a[data-method=delete]").select {|link| link.text == "Delete" and link['href'] == "\/keychains\/#{keychain.id}"}
  delete_links.size.should > 0

end
