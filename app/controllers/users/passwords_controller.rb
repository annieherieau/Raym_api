class Users::PasswordsController < Devise::PasswordsController
 
  # POST /resource/password
  # envoi du mail reset_password_instructions
  # adresse dans le mail : /password/edit?reset_password_token=abcdef
  def create # rubocop:todo Metrics/AbcSize, Metrics/MethodLength
    if params[:email].blank?
      render json: {
        status: { code: 422,
                  message: 'Email manquant.' }
      }, status: :unprocessable_entity
    end
    @user = User.find_by(email: params[:email].downcase)

    # if user.present? && user.confirmed_at?
    if @user.present?
      #  générer le reset_password_token
      @token = @user.generate_password_token!
      headers['Authorization'] = "Bearer #{@token}"

      # envoyer l'email
      if @user.send_reset_password_instructions(@token)
        render json: {
          status: { code: 200,
                    message: "E-mail d'instructions envoyé avec succès. Veuillez vérifier vos spams." }
        }, status: :ok
      else
        render json: {
          status: { code: 418,
                    message: "Une erreur s'est produite. Merci d'essayer plus tard." }
        }, status: :ok
      end
    else
      render json: {
        status: { code: 404,
                  message: "Adresse e-mail introuvable. S'il vous plaît, vérifiez et essayez à nouveau." }
      }, status: :not_found

    end
  end

  # PUT /resource/password
  def update # rubocop:todo Metrics/AbcSize, Metrics/MethodLength
    # reset_password_token
    @reset_password_token = request.headers['Authorization'].sub('Bearer ', '')
    if @reset_password_token.blank?
      render json: {
        status: { code: 422,
                  message: 'Reset_password_token manquant dans les en-têtes.' }
      }, status: :unprocessable_entity
    end

    # trouver user
    @user = find_user_by_reset_password_token(@reset_password_token)
    if @user.present? && @user.password_token_valid?
      if @user.reset_password!(params[:password])
        render json: {
          status: { code: 200,
                    message: 'Mot de passe mis à jour avec succès' }
        }, status: :ok
      else
        render json: {
          status: { code: 422,
                    message: "Le mot de passe n'a pas pu être mis à jour: #{@user.errors.full_messages}" }
        }, status: :unprocessable_entity
      end
    else
      render json: {
        status: { code: 404,
                  message: "Lien non valide ou expiré. Essayez de générer un nouveau lien." }
      }, status: :not_found
    end
  end

  protected

  def find_user_by_reset_password_token(token)
    hashed = Devise.token_generator.digest(User, :reset_password_token, token)
    User.find_by(reset_password_token: hashed)
  end
end
