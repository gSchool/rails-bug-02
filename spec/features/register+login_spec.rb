require 'rails_helper'
require 'capybara/rails'

feature 'Register' do

  scenario 'User is logged in on registry' do
    c = 'registrations'
    a = 'new'
    visit (url_for :controller => c, :action => a)
    fill_in "Name", with: "Jimmy"
    fill_in "Email", with: "jimmy@example.com"
    fill_in "Password", with: "password"
    fill_in "Confirm", with: "password"
    within(".registration-form") { click_on "Register" }
    expect(page).to have_content("jimmy@example.com")
  end

end
