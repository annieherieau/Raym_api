# frozen_string_literal: true

class ApplicationController < ActionController::API
  protected

  def is_admin?
    user_signed_in? && current_user.admin
  end

  def authenticate_admin!
    return if is_admin?

    render json: {
      status: { code: 401,
                message: 'Must be an Admin user.' }
    }, status: :unauthorized
  end

  def product_with_details(product)
    product.as_json.merge(
      category: product.category,
      color: product.color,
      photo_url: product.photo_url
    )
  end
end
