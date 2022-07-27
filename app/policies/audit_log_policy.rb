class AuditLogPolicy < ApplicationPolicy
  def index?
    true if admin?
  end

  private

  def admin?
    admin_types.include?(user.type)
  end
end
