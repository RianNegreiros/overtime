class Post < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  belongs_to :user
  validates_presence_of :date, :work_performed, :daily_hours

  validates :daily_hours, numericality: { greater_than: 0.0 }

  scope :posts_by, ->(user) { where(user_id: user.id) }

  after_save :update_audit_log
  after_save :un_confirm_audit_log, if: :rejected?

  private

  def update_audit_log
    audit_log = AuditLog.where(user_id: self.user_id, start_date: (self.date - 7.days..self.date)).last
    audit_log.confirmed! if audit_log
  end

  def un_confirm_audit_log
    audit_log = AuditLog.where(user_id: self.user_id, start_date: (self.date - 7.days..self.date)).last
    audit_log.pending! if audit_log
  end
end
