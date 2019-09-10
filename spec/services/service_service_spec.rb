require 'rails_helper'

describe ServiceService do
  it 'can query for events by city' do
    event_data = ServiceService.events_filtered({city: "Denver"})

    expect(event_data).to be_an(Array)
  end
end
