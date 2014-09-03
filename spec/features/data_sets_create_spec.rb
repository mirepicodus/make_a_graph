require 'spec_helper'

describe "the data_set create process" do
  it "redirects user that is not logged in to login page" do
    visit '/data_sets/new'
    expect(current_path).to eq '/login'
  end

  it "allows user that is signed in to create new data_set" do
    visit '/signup'
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Sign Up'
    visit '/data_sets/new'
    fill_in 'Name', :with => 'Test Name'
    fill_in 'Node', :with => 'Test Node'
    fill_in "Json data", :with => '[{"hello": "goodbye"}]'
    click_button 'Create Data set'
    page.should have_content 'Thanks for submitting!'
  end

  it "does not allows user to leave field blank in creating a data_set" do
    visit '/signup'
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Sign Up'
    visit '/data_sets/new'
    fill_in 'Name', :with => ''
    fill_in 'Node', :with => ''
    fill_in "Json data", :with => '[{"hello": "goodbye"}]'
    click_button 'Create Data set'
    page.should have_content 'Please fix these errors:'
  end

end
