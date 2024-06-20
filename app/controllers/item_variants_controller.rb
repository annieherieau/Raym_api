class ItemVariantsController < ApplicationController
  before_action :set_item_variant, only: %i[ show update destroy ]

  # GET /item_variants
  def index
    @item_variants = ItemVariant.all

    render json: @item_variants
  end

  # GET /item_variants/1
  def show
    render json: @item_variant
  end

  # POST /item_variants
  def create
    @item_variant = ItemVariant.new(item_variant_params)

    if @item_variant.save
      render json: @item_variant, status: :created, location: @item_variant
    else
      render json: @item_variant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /item_variants/1
  def update
    if @item_variant.update(item_variant_params)
      render json: @item_variant
    else
      render json: @item_variant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /item_variants/1
  def destroy
    @item_variant.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_variant
      @item_variant = ItemVariant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_variant_params
      params.fetch(:item_variant, {})
    end
end
