class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:current, :check_admin]
  
    def current
      render json: current_user, only: [:id, :email]
    end

    def check_admin
      is_admin = current_user&.admin? # Assuming you have an `admin?` method on your User model
      render json: { admin: is_admin }
    end

    def admin?
      self.admin
    end

    def destroy
      user = User.find(params[:id])
      if user.destroy
        render json: { message: 'User deleted successfully' }, status: :ok
      else
        render json: { error: 'Failed to delete user' }, status: :unprocessable_entity
      end
    end
end
