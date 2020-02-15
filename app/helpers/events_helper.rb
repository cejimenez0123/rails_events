module EventsHelper
    def order_by(order)
        @order_by = ["Most recent", "Most old","A-Z", "Z-A"]
        events = Event.all
        if params.dig(:options,:id) == "Most old"
            @events = events.order("created_at DESC")
            redirect_to 'index' 
        elsif params.dig(:options,:id) == "A-Z"
            @events = events.order("name ASC")
            redirect_to 'index' 
        elsif params.dig(:options,:id) == "Z-A"
            @events = events.order("name DESC")
            redirect_to 'index' 
        elsif params.dig(:options,:id) == "Most recent"
            @events = events.order("created_at ASC")
            redirect_to 'index' 
        else
            @events = events.order("created_at ASC")
            redirect_to 'index' 
        end
    end
end
