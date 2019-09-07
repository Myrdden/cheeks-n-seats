class EventController < ApplicationController
  def show
  end
  def index
    filter_by = {}
    if params[:genre]
      filter_by[:genre] = params[:genre]
    end
    if params[:city]
      filter_by[:city] = params[:city]
    end
    if params[:price]
      filter_by[:price] = params[:price]
    end
    @events = ServiceService.events_filtered(filter_by)
  end
end
