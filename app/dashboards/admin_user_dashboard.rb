require "administrate/base_dashboard"

class AdminUserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    posts: Field::HasMany.with_options(searchable: false),
    id: Field::Number.with_options(searchable: false),
    email: Field::String.with_options(searchable: true),
    sign_in_count: Field::Number.with_options(searchable: false),
    current_sign_in_at: Field::DateTime.with_options(searchable: false),
    last_sign_in_at: Field::DateTime.with_options(searchable: false),
    current_sign_in_ip: Field::String.with_options(searchable: false),
    last_sign_in_ip: Field::String.with_options(searchable: false),
    first_name: Field::String.with_options(searchable: false),
    last_name: Field::String.with_options(searchable: false),
    type: Field::String.with_options(searchable: false),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false),
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    posts
    id
    email
    type
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    posts
    id
    email
    encrypted_password
    reset_password_token
    reset_password_sent_at
    remember_created_at
    first_name
    last_name
    type
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    posts
    email
    password
    first_name
    last_name
  ].freeze
  COLLECTION_FILTERS = {}.freeze
end
