class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  before_action :authenticate_admin!, only: [:create, :update, :destroy]

  # GET /products
  def index
    if params[:category].present?
      @products = Product.where(category: params[:category]).map do |product|
        product_with_details(product)
      end
    else
      @products = Product.all.map do |product|
        product_with_details(product)
      end
    end

    render json: @products, status: :ok
  end

  # GET /products/:id
  def show
    render json: product_with_details(@product)
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: product_with_details(@product), status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/:id
  def update
    if @product.update(product_params)
      render json: product_with_details(@product), status: :ok
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/:id
  def destroy
    if @product.destroy
      render json: { message: "Produit supprimé" }, status: :ok
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :description, :price, :photo,  :category_id, :color_id)
  end
end
