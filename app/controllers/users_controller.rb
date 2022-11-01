class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def destroy 
    @user = User.find(params[:id])
    @user.destroy
    render json: { message: "User #{params[:id]} successfully destroyed" }
  end

  def create 
    User.create(user_params)
  end

  def update 
    @user = User.find(params[:id])
    @user.update( params.permit(:username, :profile_picture))
  end

  def login 
    @user = User.find_by(username: user_params[:username]).try(:authenticate, user_params[:password])
    session[:user_id] = @user.id
    render json: { message: "You have successfully logged in!", session_id: session[:user_id] }
  end

  def logout
    session[:user_id] = nil
  end

  private

  def user_params
    params.permit(:username, :password, :profile_picture)
  end
end
