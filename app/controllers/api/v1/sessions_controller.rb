class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
     if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UserApiSerializer.new(user).api_key, status: :ok
     else
       render status: :not_found
     end
  end
end
