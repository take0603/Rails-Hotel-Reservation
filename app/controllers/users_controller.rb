class UsersController < ApplicationController
  before_action :authenticate_user!

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
    flash[:notice] = "プロフィール情報が更新されました。"
    redirect_to users_profile_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :user_image)
  end
#ここまで

end
