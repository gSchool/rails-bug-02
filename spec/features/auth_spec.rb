require 'rails_helper'
require 'capybara/rails'

feature 'Auth' do

  scenario 'Users can login and out' do
    create_user email: "user@example.com"

    visit root_path
    within(".signin-form") { click_on "Login" }
    expect(page).to have_content("Username / password is invalid")

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    within(".signin-form") { click_on "Login" }
    expect(page).to have_content("user@example.com")
  end

  scenario 'Users can register' do
    visit new_registration_path
    fill_in "Name", with: "Annie Test"
    fill_in "Email", with: "aelydens@test.com"
    fill_in "Password", with: "password"
    fill_in "Confirm", with: "password"
    within("form") { click_on "Register" }

    expect(page).to have_content("aelydens@test.com")
  end
end
