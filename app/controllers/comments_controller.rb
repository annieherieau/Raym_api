class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  # GET /comments
  def index
    @product = Product.find(params[:product_id])
    @comments = @product.comments.includes(:user)
    render json: @comments.as_json(include: { user: { only: [:first_name] } })
  end

  # GET /comments/:id
  def show
    render json: @comment
  end

  # POST /products/:product_id/comments
  def create
    @product = Product.find(params[:product_id])

    # Vérifier si l'utilisateur a déjà commenté ce produit
    existing_comment = @product.comments.find_by(user_id: current_user.id)
    if existing_comment
      render json: { error: "You have already commented on this product" }, status: :forbidden
      return
    end

    @comment = @product.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/:id
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/:id
  def destroy
    if current_user == @comment.user || current_user.admin?
      @comment.destroy
      head :no_content
    else
      render json: { error: 'You are not authorized to delete this comment' }, status: :forbidden
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:content, :rating)
  end
end
