class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])

    unless @user.phone_number.present?
      @user.errors[:phone_number] << "has not been set"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(
        params.require(:user).permit(:phone_number)
    )
    redirect_to newest_posts_path(@user)
  end
end
