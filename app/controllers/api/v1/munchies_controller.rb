class Api::V1::MunchiesController < ActionController::API
  def index
    facade = MunchieFacade.new(params[:start], params[:end], params[:food])
    binding.pry
    render json: MunchieSerializer.new
  end
end
