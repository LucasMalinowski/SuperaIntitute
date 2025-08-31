class ProjectPolicy < ApplicationPolicy
  def show?
    record.published? || user&.admin?
  end
end
