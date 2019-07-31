class Api::V1::UsersController < ActionController::API
  def create
    key = SecureRandom.urlsafe_base64
    user = User.create(user_params)
    user.update(api_key: key)
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
    end
  end

  private

    def user_params
          params.permit(:email, :password, :password_confirmation)
    end
end
