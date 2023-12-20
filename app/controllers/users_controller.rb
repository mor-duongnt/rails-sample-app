class UsersController < ApplicationController

  def new
    @new_user_form = User::NewUserForm.new
  end

  def create
    @new_user_form = User::NewUserForm.new
    @result = @new_user_form.save

    if @result.errors.any?
      render :new
    else
      @user = @new_user_form.user
      redirect_to user_path @user
    end
  end

  private
  def user_params
    params.require(:user_new_user_form).permit(:email, :first_name, :last_name, :major, :skill, :address_name, :note)
  end
end
