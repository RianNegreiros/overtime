class User < ApplicationRecord
  has_many :posts
  has_many :audit_logs
  has_many :hands_associations, class_name: 'Hand'
  has_many :hands, through: :hands_associations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name, :phone

  PHONE_REGEX = /\A\d*\Z/

  validates_format_of :phone, with: PHONE_REGEX

  validates :phone, length: { is: 12 }

  def full_name
    last_name.upcase + ", " + first_name.upcase
  end
end
