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
   visit root_path
   click_on "Register"
   fill_in "Name", with: "Ryan"
   fill_in "Email", with: "ryan@email.com"
   fill_in "Password", with: '12345'
   fill_in "Confirm", with: '12345'
   click_button "Register"
   expect(page).to have_content("ryan@email.com")
 end



end
