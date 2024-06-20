class VariantsController < ApplicationController
  before_action :set_variant, only: %i[ show update destroy ]
  before_action :authenticate_admin!
  
  # GET /variants
  def index
    @variants = Variant.all

    render json: @variants
  end

  # GET /variants/1
  def show
    render json: {variant: @variant, option: @variant.option}, status: :ok
  end

  # POST /variants
  def create
    @variant = Variant.new(variant_params)

    if @variant.save
      render json: @variant, status: :created, location: @variant
    else
      render json: @variant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /variants/1
  def update
    if @variant.update(variant_params)
      render json: @variant
    else
      render json: @variant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /variants/1
  def destroy
    if @variant.destroy!
      render json: { message: "Variant deleted" }, status: :ok
    else
      render json: @variant.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variant
      @variant = Variant.find(params[:id])
    end

    def set_option
      @option = Option.find(@variant.option_id)
    end

    # Only allow a list of trusted parameters through.
    def variant_params
      params.require(:variant).permit(:name, :description, :option_id)
    end
end
