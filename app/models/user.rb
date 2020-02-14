class User < ActiveRecord::Base
    has_many :rsvps
    has_many :events, through: :rsvps
    has_many :created_events, class_name: "Event", foreign_key: "created_by_id"
    has_secure_password
    
end
