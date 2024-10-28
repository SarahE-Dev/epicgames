class Admin::DashboardController < ApplicationController
  before_action :authorize_admin

  def index
    @users = User.all
    @admin_count = User.admin.count
    @user_count = User.user.count
    @recent_users = User.order(created_at: :desc).limit(5)
  end

  private

  def authorize_admin
    authorize :dashboard, :admin_dashboard?
  end
end
