require 'rails_helper'
require 'capybara/rails'

feature 'Register' do
    scenario 'Make sure current_path equal to registration_path' do
        create_user email: "johnny@example.com"
        visit root_path
        within(".auth"){click_on "Register"}
        expect(page).to have_content("Register")

        fill_in "Name", with: "John Doe"
        fill_in "Email", with: "johnny@example.com"
        fill_in "Password", with: "johnjohn"
        fill_in "Confirm", with: "johnjohn"

        within(".registration-form"){click_on "Register"}
        expect(current_path).to eql(registrations_path)
    end

    scenario 'Throw an error' do
        create_user email: "johnny@example.com"
        visit root_path
        within(".auth"){click_on "Register"}
        expect(page).to have_content("Register")

        fill_in "Name", with: "John Doe"
        fill_in "Email", with: "johnny@example.com"
        fill_in "Password", with: "johnjohn"
        fill_in "Confirm", with: "johnjohn"

        within(".registration-form"){click_on "Register"}
        expect(current_path).not_to eql("")
    end
end
