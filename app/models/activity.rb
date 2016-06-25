class Activity < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :location

  validates :description, :itinerary_id, :location_id, presence: :true
end
