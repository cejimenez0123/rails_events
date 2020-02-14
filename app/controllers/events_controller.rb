class EventsController < ApplicationController
    def index
        @events = Event.all
    end
    def new
        @event = Event.new
    end
    def create
        @event = Event.create(event_params)
    end
    def show
        @event = Event.find(params[:id])
    end
    private 

    def event_params
        params.require(:event).permit(:name,:discription,created_by_id:curennt_user.id)
    end
end
