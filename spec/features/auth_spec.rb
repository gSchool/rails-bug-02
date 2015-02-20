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

  scenario 'User can register as a new user' do
    visit root_path
    click_on 'Register'
    fill_in 'Name', with: 'Steve'
    fill_in 'Email', with: 'Steve@steve.com'
    fill_in 'Password', with: 'stevesucks'
    fill_in 'Confirm', with: 'stevesucks'
    click_on 'Submit'
    expect(page).to have_content "Welcome Steve"
  end

end
