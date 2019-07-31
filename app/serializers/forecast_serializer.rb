class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id

  attribute :image do |object|
    object.image
  end

  attribute :current_weather do |object|
    object.current_weather
  end

  attribute :hourly_weather do |object|
    object.hourly_weather
  end

  attribute :daily_weather do |object|
    object.daily_weather
  end 
end
