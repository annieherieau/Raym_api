class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show update destroy ]
  before_action :authenticate_admin!, only: %i[ create update destroy ]

  # GET /products
  def index
    @products = Product.all
    render json: @products.as_json(methods: :photo_url)
  end

  # GET /products/:id
  def show
    render json: @product.as_json(methods: :photo_url)
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product.as_json(methods: :photo_url), status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/:id
  def update
    if @product.update(product_params)
      render json: @product.as_json(methods: :photo_url)
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/:id
  def destroy
    if @product.destroy!
      render json: { message: "Product deleted" }
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
    params.require(:product).permit(:name, :description, :price, :photo)
  end
end
