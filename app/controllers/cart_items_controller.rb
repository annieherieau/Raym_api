class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  def show
    @cart_items = @cart.cart_items.order('created_at').includes(:product)
  end
  # POST /cart_items
  def create
    @product = Product.find_by(id: params[:product_id].to_i)
    
    if @product
      existing_cart_item = @cart.cart_items.find_by(product_id: @product.id)
      
      if existing_cart_item
        # Si l'article existe déjà, mettre à jour la quantité
        new_quantity = existing_cart_item.quantity + 1
        if existing_cart_item.update(quantity: new_quantity)
          render json: existing_cart_item, status: :ok
        else
          render json: existing_cart_item.errors, status: :unprocessable_entity
        end
      else
        # Si l'article n'existe pas, créer un nouvel article dans le panier
        @cart_item = @cart.cart_items.new(cart_item_params.merge(product: @product))
        if @cart_item.save
          render json: @cart_item, status: :created
        else
          render json: @cart_item.errors, status: :unprocessable_entity
        end
      end
    else
      render json: { error: 'Product not found' }, status: :not_found
    end
  end
  
  # PUT ou PATCH /cart_items/:id
  def update
    cart_item = @cart.cart_items.find(params[:id])
    if cart_item.update(cart_item_params)
      render json: cart_item, include: :product
    else
      render json: cart_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cart_items/:id
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
