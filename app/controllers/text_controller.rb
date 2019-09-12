class TextController < ApplicationController
  def show
  end

  def create
    event = Event.find(params[:event])
    message = "Your friend has invited you to see the play #{event.title} with them"
    Text.create(params[:phone_number], message)

    redirect_to '/show'
  end
end
