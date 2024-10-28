class DashboardPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        if user.admin?
          scope.all
        else
          scope.where(user_id: user.id)
        end
      end
    end
  
    def admin_dashboard?
      user.admin?
    end
  
    def user_dashboard?
      true
    end
  end