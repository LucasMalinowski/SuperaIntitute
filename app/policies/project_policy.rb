# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user&.editor? || user&.admin?
  end

  def update?
    user&.editor? || user&.admin?
  end

  def destroy?
    user&.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end