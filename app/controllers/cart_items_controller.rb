class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  def show
    @cart_items = @cart.cart_items.includes(:product)
  end
  def create
    @product = Product.find_by(id: params[:product_id].to_i)
    puts ("params[:product_id]")
    puts (params[:product_id])
    if @product
      @cart_item = @cart.cart_items.new(cart_item_params.merge(product: @product))
      if @cart_item.save
        render json: @cart_item, status: :created
      else
        render json: @cart_item.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Product not found' }, status: :not_found
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
    @cart = current_user.cart || current_user.create_cart
  end

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end
end
