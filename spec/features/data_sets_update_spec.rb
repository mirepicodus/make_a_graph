require 'rails_helper'

describe "the data_set edit process" do

  it "allows user that is signed in to update data_set" do
    visit '/login'
    user = User.create(:email => 'user@example.com', :password => 'password')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Log In'
    data_set = user.data_sets.create(node: "hello", json_data: [{"hello"=>"goodbye"}], name: "hi")
    visit "/data_sets/#{data_set.id}/edit"
    fill_in 'Name', :with => 'Test Name'
    fill_in 'Node', :with => 'hello'
    fill_in "Json data", :with => '[{"hello": "goodbye"}]'
    click_button 'Update Data set'
    page.should have_content 'Thanks for updating!'
  end

  it "does not allows user to leave name blank while updating a data_set" do
    visit '/login'
    user = User.create(:email => 'user@example.com', :password => 'password')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Log In'
    data_set = user.data_sets.create(node: "hello", json_data: [{"hello"=>"goodbye"}], name: "hi")
    visit "/data_sets/#{data_set.id}/edit"
    fill_in 'Name', :with => ''
    fill_in 'Node', :with => 'hello'
    fill_in "Json data", :with => '[{"hello": "goodbye"}]'
    click_button 'Update Data set'
    page.should have_content "Name can't be blank"
  end

  it "does not allows user to enter non json data_set" do
    visit '/signup'
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Sign Up'
    visit '/data_sets/new'
    fill_in 'Name', :with => 'Test Name'
    fill_in 'Node', :with => 'Test Node'
    fill_in "Json data", :with => 'sfd'
    click_button 'Create Data set'
    page.should have_content 'Not JSON format.'
  end


  it "does not allows user to enter non json data_set" do
    visit '/signup'
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Sign Up'
    visit '/data_sets/new'
    fill_in 'Name', :with => 'Test Name'
    fill_in 'Node', :with => 'hi'
    fill_in "Json data", :with => '[{"hello": "goodbye"}]'
    click_button 'Create Data set'
    page.should have_content 'Node not included as key in JSON'
  end

end
