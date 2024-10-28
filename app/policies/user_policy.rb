class UserPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        if user.admin?
          scope.all
        else
          scope.where(id: user.id)
        end
      end
    end
  
    def index?
      admin?
    end
  
    def show?
      admin? || record == user
    end
  
    def update?
      admin? || record == user
    end
  
    def destroy?
      admin? && record != user
    end
  end