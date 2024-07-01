# frozen_string_literal: true

class ColorProductsController < ApplicationController
  before_action :set_color_product, only: %i[show update destroy]

  # GET /color_products
  def index
    @color_products = ColorProduct.all

    render json: @color_products
  end

  # GET /color_products/1
  def show
    render json: @color_product
  end

  # POST /color_products
  def create
    @color_product = ColorProduct.new(color_product_params)

    if @color_product.save
      render json: @color_product, status: :created, location: @color_product
    else
      render json: @color_product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /color_products/1
  def update
    if @color_product.update(color_product_params)
      render json: @color_product
    else
      render json: @color_product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /color_products/1
  def destroy
    @color_product.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_color_product
    @color_product = ColorProduct.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def color_product_params
    params.require(:color_product).permit(:color_id, :product_id)
  end
end
