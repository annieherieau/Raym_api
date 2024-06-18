class AdminDashboardController < ApplicationController
  before_action :authenticate_admin!

  respond_to :json

  # GET /admin/:ressource (users ou admins)
  def index
    admin = params[:ressource] == 'admins' ? true : false
    @users = User.all.where(admin: admin)
    render json: {
          status: { code: 200,
            message: "Liste des #{params[:ressource]}" },
          data: @users
        }, status: :ok
  end
end
