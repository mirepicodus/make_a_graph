require 'spec_helper'

describe "the signup process" do
  it "signsup a user that gives email and correct password and confirmation" do
    visit '/signup'
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Sign Up'
    page.should have_content 'Logged in as user@example.com'
  end

  it "gives error when a user that gives incorrect email, password or confirmation" do
    visit '/signup'
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'kjsldkfj'
    click_button 'Sign Up'
    page.should have_content 'Please fix these errors'
  end

end
