class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    return redirect_to root_path if params[:id] == "sign_out"

    @user = User.find(params[:id])
  end
end
