# frozen_string_literal: true

class UserDashboardController < ApplicationController
  before_action :authenticate_user!

  # GET /my_profile
  def show
    if current_user
      render json: {
        status: { code: 200,
                  message: "If you see this, you're in!" },
        user: current_user
      }, status: :ok
    else
      render json: {
        status: { code: 404,
                  message: 'User Not Found' }
      }, status: :not_found
    end
  end
end
