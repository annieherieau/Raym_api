class UserDashboardController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_user

  # GET /my_profile
  def show
    if current_user
      render json: {
        status: {code: 200,
        message: "If you see this, you're in!"},
        user: current_user
      }
    else
      render json: {
        status: {code: 404,
        message: "User Not Found"}
      }
    end
  end
end
