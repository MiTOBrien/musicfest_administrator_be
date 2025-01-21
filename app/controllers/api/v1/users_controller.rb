class Api::V1::UsersController < ApplicationController
  
  def index
    users = User.all
    render json: UserSerializer.format_users(users)
  end

  def show

  end

end