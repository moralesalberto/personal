class UsersController < ApplicationController
  def edit
    @user = current_user
  end

    def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(user_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def user_params
    params.required(:user).permit(:current_password, :password, :password_confirmation)
  end
end
