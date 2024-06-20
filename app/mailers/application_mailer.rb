class ApplicationMailer < ActionMailer::Base
  default from: ENV['MAILJET_DEFAULT_FROM']
  layout 'mailer'

  # url de l'appli (FRONT)
  def application_url
    if Rails.env.production?
      ENV['PROD_HOST']
    else
      ENV['DEV_HOST']
    end
  end
end
