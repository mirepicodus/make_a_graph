require 'spec_helper'

describe "the signin process" do
  it "signs a user in who uses the right password" do
    visit '/sessions/new'
    user = User.create(:email => 'user@example.com', :password => 'password')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Log In'
    page.should have_content 'Logged in as user@example.com'
  end

  it "gives a user an error who uses the wrong password" do
    visit '/sessions/new'
    user = User.create(:email => 'user@example.com', :password => 'password')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'wrong'
    click_button 'Log In'
    page.should have_content 'Email or password is invalid.'
  end

end
