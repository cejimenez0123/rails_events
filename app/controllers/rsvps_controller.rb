
class RsvpsController < ApplicationController
  before_action :login_check
  def new
    event = Event.find_by(id: params[:id])
    
  end
  def create

    @rsvp = Rsvp.create(user_id: current_user.id, event_id: params[:event_id])
    redirect_to rsvps_path
  end
  def index
    @rsvps = current_user.rsvps
  end
  def destroy

    @event = Event.find(params[:event_id])
    @rsvp = current_user.rsvps.find_by(event_id: @event.id, user_id: current_user.id) 
    @rsvp.destroy
    
    
    flash[:notice]="RSVP deleted"
    redirect_to event_path(@event)
  end
  private

end
