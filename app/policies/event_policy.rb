# frozen_string_literal: true

class EventPolicy < ApplicationPolicy
  def index?
    user&.editor? || user&.admin?
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

  # Scope to restrict accessible events
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end