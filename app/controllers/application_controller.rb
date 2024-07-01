class ApplicationController < ActionController::API
  
  protected
  
  def is_admin?
    user_signed_in? && current_user.admin
  end

  def authenticate_admin!
    if (!is_admin?)
      render json: {
        status: { code: 401,
                  message: "Doit être un utilisateur administrateur." }
      }, status: :unauthorized
    end
  end
  
  def product_with_details(product)
    product.as_json.merge(
      category: product.category,
      color:  product.color,
      photo_url: product.photo_url
    )
  end
end
