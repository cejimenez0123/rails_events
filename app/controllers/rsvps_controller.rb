class RsvpsController < ApplicationController
  def new
  end
  def create
    byebug
    @rsvp = Rsvp.create(user_id: current_user.id, event_id: params[:id])
  end
  def index
    @rsvps = current_user.rsvps
  end
end
