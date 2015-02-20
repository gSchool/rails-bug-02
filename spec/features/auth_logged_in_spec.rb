require 'rails_helper'
require 'capybara/rails'

feature 'Auth to Logged In' do

  scenario 'Users are Logged In after proper registration' do

    visit new_registration_path
    within(".registration-form") { click_on "Register" }
    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Name can't be blank")


    fill_in "Name", with: "TheOne"
    fill_in "Email", with: "TheOne@me.com"
    fill_in "Password", with: "password"
    fill_in "Confirm", with: "password"
    within(".registration-form") { click_on "Register" }



    expect(page).to have_content("You are logged in successfully.")

    expect(page).to have_content("Welcome user")

  end

end
