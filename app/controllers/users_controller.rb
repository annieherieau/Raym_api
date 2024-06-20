class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:current, :check_admin]
  
    def current
      render json: current_user, only: [:id, :email]
    end

    def check_admin
      render json: current_user.admin?
    end
  end