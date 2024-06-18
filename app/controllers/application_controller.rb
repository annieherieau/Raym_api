class ApplicationController < ActionController::API
  def is_admin?
    current_user && current_user.admin
  end

  def authenticate_admin!
    if (!is_admin?)
      render json: {
        status: { code: 401,
                  message: "Must be an Admin user lol." }
      }, status: :unauthorized
    end
  end
  
end
