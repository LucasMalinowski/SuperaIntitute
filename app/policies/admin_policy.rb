# frozen_string_literal: true

class AdminPolicy < ApplicationPolicy
  # Only users with admin? can access the admin namespace.
  def access?
    user&.admin?
  end
end