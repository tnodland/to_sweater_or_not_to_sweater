class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id

  attribute :destination do |object|
    object.destination
  end

  attribute :weather do |object|
    object.weather_at_destination
  end
end
