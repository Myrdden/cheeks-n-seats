class SearchController < ApplicationController
  def index
    render locals: { facade: FilterFacade.new(params[:plays]) }
  end
end
