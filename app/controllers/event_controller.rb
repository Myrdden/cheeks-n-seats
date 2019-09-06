class EventController < ApplicationController
  def show
  end
  def index
    @events = ServiceService.events_by_city('denver')
  end
end
