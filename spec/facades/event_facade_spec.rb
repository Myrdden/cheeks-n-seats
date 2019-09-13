require 'rails_helper'

describe EventFacade do
  it 'can query for events by city' do
    fields = {city: "Denver"}
    facade = EventFacade.new(fields)
    show_genres = facade.genres

    expect(show_genres).to be_an(Array)
    expect(EventFacade).to be_a(Class)

    within(first('.genres')) do
      expect(page).to have_css('.genre')
    end
  end
end
