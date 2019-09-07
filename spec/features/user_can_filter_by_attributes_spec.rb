require 'rails_helper'

feature 'filter' do
  scenario 'user can filter plays by price, genre, date' do
    visit '/index'

    expect(current_path).to eq('/index')
    expect(page).to have_content('Genre')

    select "Comedy"
    click_on "Filter"

    expect(current_path).to eq("/index")

    within(first(".genre")) do
      expect(page).to have_content('Comedy')
    end

    # expect(page).to have_content('price')
    # expect(page).to have_content('date')
  end
end
