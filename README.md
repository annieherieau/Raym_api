# Raym Api
THP: Projet final en équipe du module Developpeur
Application Rails en mode API only :
- users avec authentification (devise + devise-jwt)
- mailer : Mailjet
- paiement : Stripe
- Application front (repo): https://github.com/annieherieau/Raym_marketplace
- Application front (prod): [raym-marketplace.onrender.com](https://raym-marketplace.onrender.com/)

## Installation en local
- Ruby 3.3.0
- Rails 7.1.3.4

Clone repository

```bash
git clone [repo]
cd [app_name]
```

Built command

```bash
bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
rails db:create
rails db:migrate
rails db:seed
rake sitemap:refresh
```

Launch server

```bash
rails server
```
## Environnement variables (secrets)
To run this project, you will need to add the following environment variables to your .env file
- super Admin
  - ADMIN_EMAIL
  - ADMIN_PASSWORD
- url de l'application front
  - DEV_HOST
  - PROD_HOST
- url de l'application back
  - BACK_HOST
- API Stripe
  - STRIPE_PUBLISHABLE_KEY
  - STRIPE_SECRET_KEY
- configuration smtp (exemple Mailjet)
  - MAILJET_LOGIN
  - MAILJET_PWD
  - MAILJET_DEFAULT_FROM
  - MAILJET_SENDER_DOMAIN
  - MAIL_DELIVERY (boolean)

**La team RAYM** : [Robena](https://github.com/Robe-Ras), [Annie](https://github.com/annieherieau), [Yann](https://github.com/YannRZG) et [Malo](https://github.com/Korblen)