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

  scenario 'Users can go to register page' do
    visit root_path
    within("div.auth") { click_on "Register" }
    expect(page).to have_content("Register")
  end

  scenario 'Users can go to register page' do
    visit new_registration_path
    within(".registration-form") { click_on "Register" }
    expect(page).to have_content("Password can't be blank")
  end

  scenario 'Users can register' do
    
    visit new_registration_path
    within(".registration-form") { click_on "Register" }
    expect(page).to have_content("Password can't be blank")

    fill_in "Name", with: "user"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Confirm", with: "password"
    within(".registration-form") { click_on "Register" }
    expect(page).to have_no_content("Password can't be blank")

  end

  scenario 'User gets to new page opened after login registration' do

    visit new_registration_path
    within(".registration-form") { click_on "Register" }
    expect(page).to have_content("Password can't be blank")

    fill_in "Name", with: "user"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Confirm", with: "password"
    within(".registration-form") { click_on "Register" }
    expect(page).to have_content("You are logged in successfully.")

  end

end
