class Event < ActiveRecord::Base
    has_many :rsvps
    belongs_to :category
    has_many :users, through: :rsvps
    belongs_to :created_by, class_name: "User", foreign_key: "created_by_id"
    accepts_nested_attributes_for :category
    validates :name, :discription, presence: true
    def category_search(id)
        where(category_id: id)
    end
 
end
