class PostPolicy < ApplicationPolicy
  def update?
    return true if record.approved? && admin?
    true if user_or_admin && !post_approved?
  end

  def approve?
    admin?
  end

  private

  def user_or_admin
    record.user_id == user.id || admin?
  end

  def admin?
    admin_types.include?(user.type)
  end

  def post_approved?
    record.approved?
  end
end
