class ApplicationController < ActionController::API
  def is_admin?
    current_user && current_user.admin
  end
end
