class Api::V1::UsersController < ApplicationController
  def create
    user = User.create!(user_params)
    binding.pry
    if user.save
      #render json with api key
    else
      #render 404
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
