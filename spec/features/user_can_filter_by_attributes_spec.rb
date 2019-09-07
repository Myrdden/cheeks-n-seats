require 'rails_helper'

feature 'filter' do
  scenario 'user can filter plays by price, genre, date' do
    visit '/index'

    expect(current_path).to eq('/index')
    expect(page).to have_content('genre')

    select "comedy"
    click_on "Filter"

    expect(current_path).to eq("/search")

    within(first(".genre")) do
      expect(page).to have_content('comedy')
    end

    # expect(page).to have_content('price')
    # expect(page).to have_content('date')
  end
end
