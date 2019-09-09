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
    if params[:price_start]
      filter_by[:price_start] = params[:price_start]
    end
    if params[:price_end]
      filter_by[:price_end] = params[:price_end]
    end
    if params[:date]
      params[:date]
    end
    @events = ServiceService.events_filtered(filter_by)
    @genres = ServiceService.get_genres()
  end
end
