class CartsController < ApplicationController
  before_action :set_cart
  before_action :set_action, only: %i[update]
  before_action :authenticate_user!

  # GET cart/
  def show
    @cart_items = @cart.cart_items.includes(:product)
    render json: {amount: @cart.amount, items: @cart_items.as_json(include: :product)}
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
    @cart = current_user.cart || current_user.create_cart
  end

  def set_action
    @action = params[:cart][:action]
  end

  def cart_params
    params.require(:cart).permit(:action)
  end
end
