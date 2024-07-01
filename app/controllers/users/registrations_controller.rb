# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!, only: %i[update]
  before_action :set_user, only: %i[update]

  respond_to :json

  # POST /users
  def create
    super
  end

  # PUT /users
  def update
    return render json: { errors: "Utilisateur non trouvé" }, status: :not_found if @user.nil?

    unless @user.valid_password?(params[:current_password])
      return render json: { errors: "Mot de passe incorrect" }, status: :unauthorized
    end

    if @user.update(update_user_params)
      render json: {
        status: { code: 200, message: "L'utilisateur a mis à jour avec succès." },
        data: { user: @user }
      }, status: :ok
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @token = request.headers['Authorization'].split(' ').last
    @user = User.get_user_from_token(@token)
  end

  def update_user_params
    params.permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
