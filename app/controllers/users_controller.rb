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
end
