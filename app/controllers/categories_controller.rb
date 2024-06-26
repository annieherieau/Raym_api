class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show update destroy ]
  before_action :authenticate_admin!, only: [:create, :update, :destroy]

  # GET /categories  -- pour le configurateur /categories?display=configurator
  def index
    case params[:display]
    when "configurator"
      @categories = Hash.new
      Category.where(configurator: true).each do |category|
        @categories[category.name] = category.products.map do |product|
           product[:name] = "#{product.name} - #{product.color.collection}"
           product.as_json.merge(image: product.photo_url)
        end
      end
    when "shop"
      
    else
      @categories = Category.all
    end

    render json: @categories, status: :ok
  end

  # GET /categories/1
  def show
    render json: @category, status: :ok
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created, location: @category, status: :ok
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      render json: @category, status: :ok
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  def destroy
    if @category.destroy!
      render json: { message: "Category deleted" }
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :configurator, :bike, :clothing)
    end
end
