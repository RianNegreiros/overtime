class ApplicationController < ActionController::Base
  include Pundit::Authorization
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  add_flash_types :danger, :info, :warning, :success, :messages

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def admin_types
    ['AdminUser']
  end


  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end
end
