class UsersController < ApplicationController

  before_action :find_user

  def show
    find_user
  end

  def edit
    find_user
  end

  def update
    find_user
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :school, :email, :password, :current_password)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
