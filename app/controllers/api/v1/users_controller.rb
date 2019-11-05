class Api::V1::UsersController < ApplicationController
  require 'securerandom'

  def create
    user = User.new(user_params)
    if user.save
      render json: UserApiSerializer.new(user).api_key, status: :created
    else
      render status: :not_found
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
