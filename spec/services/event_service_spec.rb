require 'rails_helper'

describe EventService do
  it 'can query for events by city' do
    event_data = EventService.fetch_events({city: "Denver"})

    expect(event_data).to be_an(Array)
    expect(event_data[0]).to be_an(Hash)
  end
end
