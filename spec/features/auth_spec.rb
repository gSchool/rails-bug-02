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

  scenario 'Users can register and automatically login after registration' do
    visit root_path

    click_link "Register"

    within(".registration-form") {expect(page).to have_content("Register")}

    fill_in "Name", with: "Mahamdi Gandhi"
    fill_in "Email", with: "peace@hotmail.com"
    fill_in "Password", with: "lovenotwar"
    fill_in "Confirm", with: "lovenotwar"

    within(".registration-form") {click_on "Register"}
    expect(page).to have_content("Welcome peace@hotmail.com")

    # expect(page).to have_xpath?('/registrations/new')
    #
    # fill_in "Name", with: "John Smith"
    # fill_in "Email", with: "johnsmith@yahoo.com"
    # fill_in "Password", with: "johnsmith"
    # fill_in "Confirm", with: "johnsmith"
    # click_button('Register')
    # expect(page).to have_content("Welcome John Smith")
    # expect(page).to have_contect("You are logged in successfully.")

  end

end
