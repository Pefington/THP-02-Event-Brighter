class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(
      email: params[:email],
      first_name: params[:first_name],
      last_name: params[:last_name],
      description: params[:description]
    )
      flash.now[:success] = 'User successfully updated!'
      redirect_to user_path(@user.id)
    else
      @user.errors.full_messages.each { |m| flash.now[:alert] = m }
      render :edit
    end
  end

  private

  def authenticate_user
    return if current_user

    flash[:alert] = 'Please log in.'
    redirect_to new_user_session_path
  end

end
