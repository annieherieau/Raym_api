# frozen_string_literal: true

class StaticPagesController < ApplicationController
  respond_to :json

  # POST /contact
  def send_contact_email
    UserMailer.visitor_contact_email(params[:static_pages]).deliver_now
    send_to_admin = UserMailer.admin_contact_email(params[:static_pages]).deliver_now

    return unless send_to_admin

    render json: {
      status: { code: 200,
                message: 'Votre message a bien été envoyé.' }
    }, status: :ok
  end
end
