class Users::DashboardController < ApplicationController
  def index
    authorize :dashboard, :user_dashboard?
  end
end
