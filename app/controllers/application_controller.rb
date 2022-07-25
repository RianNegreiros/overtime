class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  add_flash_types :danger, :info, :warning, :success, :messages
end
