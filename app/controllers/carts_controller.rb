class CartsController < ApplicationController
  before_action :set_cart

  def show
    @cart_items = @cart.cart_items.includes(:product)
    render json: @cart_items, include: :product
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.create_cart
  end
end
