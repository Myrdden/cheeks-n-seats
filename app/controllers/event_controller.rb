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
    if params[:minPrice]
      filter_by[:minPrice] = params[:minPrice]
    end
    if params[:maxPrice]
      filter_by[:maxPrice] = params[:maxPrice]
    end
    if params[:date]
      params[:date]
    end
    @venue_info = EventFacade.new(filter_by)
  end
end
