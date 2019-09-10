require 'rails_helper'

describe EventService do
  it 'can query for events by city' do
    event_data = EventService.events_filtered({city: "Denver"})

    expect(event_data).to be_an(Array)
  end
end
