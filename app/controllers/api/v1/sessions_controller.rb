class Api::V1::SessionsController< ActionController::API
  def create
    if User.find_by(email: params[:email])
      user = User.find_by(email: params[:email])
      if user.authenticate(params[:password])
        render json: UserSerializer.new(user), status: 200
      end
    else
    end
  end
end
