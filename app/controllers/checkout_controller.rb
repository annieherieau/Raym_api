class CheckoutController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[create cancel]
  before_action :set_order_id, only: %i[success]

# creation du checkout à partir de l'order
  def create
    application_url = Rails.env.production? ? ENV['PROD_HOST'] || 'localhost:3000'  : ENV['DEV_HOST'] || 'localhost:3000' 
    application_url += '/order/'+  (@order.id).to_s + '?action='
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: 'eur',
            unit_amount: (@order.amount*100).to_i,
            product_data: {
              name: 'Rails Stripe Checkout',
            },
          },
          quantity: 1
        },
      ],
      metadata: {
        order_id: @order.id
      },
      mode: 'payment',
      success_url: application_url + 'success&session_id={CHECKOUT_SESSION_ID}',
      cancel_url: application_url + 'cancel'
    )
    # redirect_to @session.url, allow_other_host: true
    # dans le front renvoyer le user vers @session.url
    render json: @session 
  end

  # GET /checkout/success?session_id=stripe_session_id
  def success
    @order = Order.find(@order_id)
    @order.update(paid: true)
    if @order
      @order.send_order_emails
      render json: {order: @order, message: "Paiement réussi"}, status: :ok
    end
  end

  def cancel
    if @order
      render json: {message: "Paiement annulé"}
    end
  end

  private

  def set_order
    @order = Order.find(params[:order_id].to_i)
  end
  # récupération à partir des données de la session Stripe
  def set_order_id 
    session_id = params[:session_id]
    stripe_session = Stripe::Checkout::Session.retrieve(session_id)
    @order_id = stripe_session.metadata["order_id"]
  end
end
