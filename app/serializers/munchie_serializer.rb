class MunchieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :address
end
