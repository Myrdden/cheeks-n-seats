require 'rails_helper'

RSpec.describe 'Login Page', type: :feature do
  describe 'As a registered user' do
    it 'When I click the Login button, and fill-in my info, I am logged in' do
      user = User.create!(name: 'Sam I Am', email: 'sam@gmail.com', password: 'test')

      visit root_path

      click_link 'Sign In'

      expect(current_path).to eq('/login')

      fill_in 'Name', with: user.name
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Login'

      expect(current_path).to eq('/profile')
      expect(page).to have_content("Welcome, #{user.name}!")
      expect(page).to have_link('Log Out')
    end

    it "displays an error message when I put in the wrong credentials" do
      user = User.create!(name: 'Sam I Am', email: 'sam@gmail.com', password: 'test')

      visit root_path

      click_link 'Sign In'

      expect(current_path).to eq('/login')

      fill_in 'Name', with: user.name
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'wrong password input'

      click_button 'Login'

      expect(page).to have_content('Wrong email and/or password. Please try again.')
    end
  end
end
