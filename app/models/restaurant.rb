class Restaurant
  attr_reader :name, :id

  def initialize(data_hash)
    @name = data_hash[:name]
    @id = data_hash[:id]
    @street = data_hash[:location][:address1]
    @city = data_hash[:location][:city]
    @state = data_hash[:location][:state]
    @zip = data_hash[:location][:zip_code]
  end

  def address
    @street + " " + @city + " " + @state + " " + @zip
  end
end
