class RolePolicy < ApplicationPolicy
  def show?
    record.published? || user&.admin?
  end
end