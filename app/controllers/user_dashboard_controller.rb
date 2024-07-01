class UserDashboardController < ApplicationController
  before_action :authenticate_user!

  # GET /my_profile
  def show
    if current_user
      render json: {
        status: {code: 200,
        message: "Si vous voyez cela, vous y êtes !"},
        user: current_user
      }, status: :ok
    else
      render json: {
        status: {code: 404,
        message: "Utilisateur non trouvé"}
      }, status: :not_found
    end
  end
end
