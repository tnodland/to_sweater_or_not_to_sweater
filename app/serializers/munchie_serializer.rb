class MunchieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :location
end
