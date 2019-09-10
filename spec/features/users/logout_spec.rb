require 'rails_helper'

RSpec.describe 'Logout', type: :feature do
  describe 'As a registered user' do
    it 'When I click the Logout button, I am logged out' do
      user = User.create!(name: 'Sam I Am', email: 'sam@gmail.com', password: 'test')

      visit root_path

      click_link 'Sign In'

      fill_in 'Name', with: user.name
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Login'

      expect(page).to have_content("Welcome, #{user.name}!")
      expect(page).to have_link('Log out')

      click_link 'Log out'
      
      expect(current_path).to eq(root_path)
      expect(page).to have_content('You are logged out.')
    end
  end
end
