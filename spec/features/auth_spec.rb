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
end

  feature 'Register' do
    scenario 'current_path equal to registration_path' do
        create_user email: "johnny@example.com"
        visit root_path
        within(".auth"){click_on "Register"}
        expect(page).to have_content("Register")

        fill_in "Name", with: "David"
        fill_in "Email", with: "David@example.com"
        fill_in "Password", with: "12345"
        fill_in "Confirm", with: "12345"

        within(".registration-form"){click_on "Register"}
        expect(current_path).to eql(registrations_path)
    end
end
