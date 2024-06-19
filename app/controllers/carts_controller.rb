class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  def show
    @cart_items = @cart.cart_items.includes(:product)
    render json: @cart_items, include: :product
  end

  private

  def set_cart
    if current_user
      @cart = current_user.cart || current_user.create_cart
      puts "Cart set successfully for user #{current_user.id}"
    else
      puts "No current user found"
      render json: { error: 'User not authenticated' }, status: :unauthorized
    end
  end
end
