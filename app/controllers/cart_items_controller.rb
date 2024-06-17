class CartItemsController < ApplicationController
  before_action :set_cart

  def create
    product = Product.find(params[:product_id])
    cart_item = @cart.cart_items.find_or_initialize_by(product: product)
    cart_item.quantity += 1
    if cart_item.save
      render json: cart_item, status: :created, include: :product
    else
      render json: cart_item.errors, status: :unprocessable_entity
    end
  end

  def update
    cart_item = @cart.cart_items.find(params[:id])
    if cart_item.update(cart_item_params)
      render json: cart_item, include: :product
    else
      render json: cart_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    cart_item = @cart.cart_items.find(params[:id])
    cart_item.destroy
    head :no_content
  end

  private

  def set_cart
    @cart = current_user.cart
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end