require 'rails_helper'

RSpec.describe 'User Registration', type: :feature do
  describe 'As a visitor' do
    it "can register a new user" do
      visit '/'

      click_link 'Register'
      expect(current_path).to eq('/register')

      name = 'Sam'
      email = 'sam@gmail.com'
      password = 'test'

      fill_in 'Name', with: name
      fill_in 'Email', with: email
      fill_in 'Password', with: password

      click_button 'Register'

      new_user = User.last

      expect(current_path).to eq('/profile')
      expect(page).to have_content("Welcome, #{new_user.name}! You are registered and logged in.")
    end

    it "displays an error message when a field is not filled" do
      visit '/'

      click_link 'Register'
      expect(current_path).to eq('/register')

      name = 'Sam'
      email = 'sam@gmail.com'
      password = 'test'

      # fill_in 'Name', with: name
      fill_in 'Email', with: email
      fill_in 'Password', with: password

      click_button 'Register'
      expect(page).to have_content("Name can't be blank")
    end

    it "displays an error message when an email is already taken" do
      User.create!(name: "Sam I Am", email: "sam@gmail.com", password: "test")

      visit '/'

      click_link 'Register'
      expect(current_path).to eq('/register')

      name = 'Sam'
      email = 'sam@gmail.com'
      password = 'test'

      fill_in 'Name', with: name
      fill_in 'Email', with: email
      fill_in 'Password', with: password

      click_button 'Register'
      expect(page).to have_content("Email has already been taken")
    end
  end
end
