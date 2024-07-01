class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart
  before_action :set_action, only: %i[update]
  before_action :authenticate_user!

  # GET cart/
  def show
    @cart_items = @cart.cart_items.order('created_at')
    @cart_items_with_details = @cart_items.map do |item|
      item.as_json.merge(product: product_with_details(item.product))
    end
    render json: {amount: @cart.amount, items: @cart_items_with_details}
  end

  # DELETE cart/clear
  def update
    case @action
    when 'clear'
      @cart.clear
      render json: { message: "Panier vidé" }, status: :ok
    when 'validate'
      @cart.validate
      render json: {order: current_user.orders.all.last,  message: "Panier validé" }, status: :ok
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  private

  def set_cart
    if current_user
      @cart = current_user.cart || current_user.create_cart
      puts "Panier défini avec succès pour l'utilisateur #{current_user.id}"
    else
      puts "Aucun utilisateur actuel trouvé"
      render json: { error: 'Utilisateur non authentifié' }, status: :unauthorized
    end
  end

  def set_action
    @action = params[:cart][:action]
  end

  def cart_params
    params.require(:cart).permit(:action)
  end
end
