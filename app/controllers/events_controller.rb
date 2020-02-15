class EventsController < ApplicationController
    def index
        if params.dig(:event,:category_id) && params.dig(:event,:category_id) != ""
            @events = Event.all.where(category_id: params[:event][:category_id])   
        else 
            @events = Event.all
        end

        
    end
    def new_rsvp
        byebug
        
        @rsvp = Rsvp.create(user_id:current_user.id, event_id: params[:id])
        redirect_to event_path(parmas[:id])
      end
    
    def new
        @event = Event.new
        @event.build_category
    end
    def create
        
        @event = Event.create(event_params)
        redirect_to event_path(@event)
    end
    def show
        @event = Event.find(params[:id])
    end
    def update
        byebug
    end
    def destroy

    end
    private 

    def event_params
        params.require(:event).permit(:name,:discription,:created_by_id,:category_id, category_attributes:[:name])
    end
end
