class Api::V1::MunchiesController < ActionController::API
  def index
    facade = MunchieFacade.new(params[:start], params[:end], params[:food])
    render json:{
       city: facade.ending_location,
       munchies: MunchieSerializer.new(facade.restaurants)
     }
  end
end
