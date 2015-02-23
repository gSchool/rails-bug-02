require 'rails_helper'
require 'capybara/rails'

feature 'Auth' do
#
#   scenario 'Users can login and out' do
#     create_user email: "user@example.com"
#
#     visit root_path
#     within(".signin-form") { click_on "Login" }
#     expect(page).to have_content("Username / password is invalid")
#
#     fill_in "Email", with: "user@example.com"
#     fill_in "Password", with: "password"
#     within(".signin-form") { click_on "Login" }
#     expect(page).to have_content("user@example.com")
#   end

  scenario "should render root page after action register is successful" do

    visit new_registration_path

    fill_in "Name", with: "JoMama"
    fill_in "Email", with: "jm@yahoo.com"
    fill_in "Password", with: "wookie"
    fill_in "Confirm", with: "wookie"
    within(".registration-form") { click_on "Register"}
    expect(page).to redirect_to(root_path)
  end
end
