class EventsController < ApplicationController
    include EventsHelper
    before_action :login_check, only: [:new,:create,:destroy]
    def index
        @order_by = [ "Most recent","Most old", "A-Z","Z-A"]
        @option 
        
        @events = Event.all if !@events
            
        
    end
    def index_scope
        @order_by = [ "Most recent","Most old", "A-Z","Z-A"]
        
        if params.dig(:events,:category_id) && !params.dig(:events,:category_id).empty?
            @events = Event.all.where(category_id: params[:event][:category_id])     
            
            @events = reorder(@events)
        elsif params.dig(:event,:category_id).empty?
           @events = reorder(@events)
        else 
            binding.pry
            @events = Event.all
        end                     
        redirect_to events_path

    end
    
    def new
        @event = Event.new
        @event.build_category
    end
    def create
        
        @event = Event.new(event_params)
        byebug
        if @event.valid?
            @event.save
            redirect_to event_path(@event)
       else
            @event.errors
            render :new
        end
    end
    def show
        @event = Event.find(params[:id])
        rsvp = Rsvp.find_by(event_id: @event.id, user_id: current_user.id)
        if rsvp
            @rsvp = rsvp
        else
             @rsvp = nil
        end
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
    def hash_order(order,hash)
  
        if order == "Most old"
           hash.order("created_at DESC")
        elsif order == "A-Z"
           hash.order("name ASC")
        elsif order == "Z-A"
           hash.order("name DESC")
        elsif order == "Most recent"
           hash.order("created_at ASC")
        else
            hash.order("created_at ASC")
        end
    end
    def reorder(hash)
        @option = params.dig(:id) 
        
        hash = hash_order(@option,hash) if !@option.nil?
    end
end
