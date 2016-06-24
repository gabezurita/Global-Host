class User < ActiveRecord::Base
  has_many :user_interests
  has_many :interests, through: :user_interests

  has_many :visitor_itineraries, foreign_key: "visitor_id", class_name: "Itinerary"
  has_many :host_itineraries, foreign_key: "host_id", class_name: "Itinerary"
end
