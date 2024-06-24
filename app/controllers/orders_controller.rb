class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show destroy ]
  before_action :not_owner, only: %i[ show destroy ]
  before_action :authenticate_user!

  # GET /orders
  def index
    if (is_admin?)
      @orders = Order.all.reverse.map do |order|
        order_with_details(order)
      end
    else
      @orders = Order.all.where(user: current_user).reverse.map do |order|
        order_with_details(order)
      end
    end
    render json: @orders, status: :ok
  end

  # GET /orders/1
  def show
    # @cart_items = @order.cart_items.includes(:product)
    # render json: {order: @order, amount: @order.amount, user_email: @order.user.email, items: @cart_items.as_json(include: :product)}, status: :ok
    render json: order_with_details(@order), status: :ok
  end

  # DELETE /orders/1
  def destroy
    @order.cancel
    if @order.delete
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

    def not_owner
      if (@order.user != current_user && !is_admin?)
        render json: {
          status: 401,
         error: "Unauthorised." 
        }, status: :unauthorized
      end
    end

    def order_with_details(order)
      items = order.cart_items.map do |item|
        item.as_json.merge(product: item.product)
      end
      order.as_json.merge(
        amount: order.amount,
        items:  items,
        user_email: order.user.email
      )
    end
end
