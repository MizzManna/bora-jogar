class FieldPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user.admin_user == true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
