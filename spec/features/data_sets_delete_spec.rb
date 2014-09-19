require 'rails_helper'

describe "the data_set delete process" do
  it "allows user that is signed in to delete data_set" do
    visit '/login'
    user = User.create(:email => 'user@example.com', :password => 'password')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Log In'
    data_set = user.data_sets.create(node: "hello", json_data: [{"hello"=>"goodbye"}], name: "hi")
    visit "/data_sets/#{data_set.id}"
    click_link 'Delete'
    page.should have_content 'Data Set deleted'
  end

end
