class Admin::UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :authorize_admin
    
    def index
      @users = policy_scope(User)
    end
  
    def show
      authorize @user
    end
  
    def edit
      authorize @user
    end
  
    def update
      authorize @user
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      authorize @user
      @user.destroy
      redirect_to admin_users_path, notice: 'User was successfully deleted.'
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:email, :role)
    end
  
    def authorize_admin
      authorize User, :index?
    end
  end