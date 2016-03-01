require 'rails_helper'
require 'capybara/rails'

feature 'Auth' do

	scenario 'new registered user should become current user' do
		 c = 'registrations'
		 a = 'new'
		visit (url_for :controller =>c, :action => a) 
			fill_in 'Name', with: 'test'
			fill_in "Email", with: "test@example.com"
    		fill_in "Password", with: "password"
    		fill_in "Confirm", with: "password"
    		within(".registration-form") { click_on "Register" }
    		expect(page).to have_content('You are logged in successfully')
    end
  end
