class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    respond_to do |format|
      if @user.save
        format.html {redirect_to @user, notice: 'User was successfully created.'}
      else
        format.html {render.new}
      end
    end
  end
end

private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
    )
  end