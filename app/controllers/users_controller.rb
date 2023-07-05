class UsersController < ApplicationController
  def account
    @user = current_user
  end

#ここからprofileページに関して
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_profile_path
  end

  private
  def user_params
    params.require(:user).permit(:icon, :name, :introduction)
  end
#ここまで

end
