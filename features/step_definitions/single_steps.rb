When /^I click on first item$/ do 
  page.find(:xpath,"//*[@name='li1']").click
end

When /^I click on second item$/ do 
  page.find(:xpath,"//*[@name='li2']").click
end
 
When /^I add new item "([^\"]*)"$/ do |keys|
  page.find(:xpath,"//*[@id='sampletodotext']").click
  fill_in('sampletodotext', :with => keys)
  page.find(:xpath,"//*[@id='addbutton']").click
end
 
Then /^I should see new item in list "([^\"]*)"$/ do |keys|
  expect(page).to have_content(keys)
  page.execute_script('lambda-status=Passed');
end
