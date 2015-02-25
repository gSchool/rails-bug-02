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

  scenario 'User is redirected to profile page after registration' do
    visit new_registration_path

    fill_in "Name", with: "Joe Mama"
    fill_in "Email", with: "joe@mama.com"
    fill_in "Password", with: "123"
    fill_in "Confirm", with: "123"
    within(".registration-form") { click_on "Register"}
    expect(page).to have_content("You are logged in successfully.")
  end

end
