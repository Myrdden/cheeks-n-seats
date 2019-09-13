class EventController < ApplicationController
  def show
    bleh = {
      name: "Totally a Super Fake Event",
      url: 'www.chucktesta.com',
      genre: 'big mood',
      venue: 'dimmsdale dimmadome',
      date: {date: 'tuesay'},
      minPrice: 4,
      maxPrice: 45000
    }
    render locals: {n: 2, event: Event.new(bleh)}
  end

  def index
    render locals: {facade: EventFacade.new(params)}
  end
end
