class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show destroy ]
  before_action :authenticate_user!

  # GET /orders
  def index
    if (is_admin?)
      @orders = Order.all
    else
      @orders = Order.all.where(user: current_user)
    end
    render json: @orders
  end

  # GET /orders/1
  def show
    @cart_items = @order.cart_items.includes(:product)
    render json: {amount: @order.amount, items: @cart_items.as_json(include: :product)}
  end

  # DELETE /orders/1
  def destroy
    @order.cancel
    if @order.destroy!
      render json: { message: "Commande annulée: produits renvoyés au panier" }
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end
  
end
