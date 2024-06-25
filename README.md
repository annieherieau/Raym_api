# Rails Api Boiler Plate

App Rails en mode API only :
- users avec authentification (devise + devise-jwt)
- mailer

**La team RAYM** : [Robena](https://github.com/Robe-Ras), [Annie](https://github.com/annieherieau), [Yann](https://github.com/YannRZG) et [Malo](https://github.com/Korblen)


## Stack
- Ruby 3.3.0
- Rails 7.1.3.4

## Installation en local

Clone repository

```bash
git clone [repo]
```

Install dépendencies

```bash
cd [app_name]
bundle install
```

Database

```bash
rails db:create
rails db:migrate
rails db:seed
```

Launch server

```bash
rails server
```
## Environnement variables (secrets)
- super Admin
  - ADMIN_EMAIL
  - ADMIN_PASSWORD
- url de l'application front
  - DEV_HOST
  - PROD_HOST
- API Stripe ()
  - STRIPE_PUBLISHABLE_KEY
  - STRIPE_SECRET_KEY
- configuration smtp (exemple)
  - MAILJET_LOGIN
  - MAILJET_PWD
  - MAILJET_DEFAULT_FROM
  - MAILJET_SENDER_DOMAIN


# Front app en réact
DEV_HOST='http://localhost:5173'
PROD_HOST="http://localhost:5173"

# Stripe
STRIPE_PUBLISHABLE_KEY='pk_test_51H2wUSLsDTxFz3YrCj92W27Zj0wfN54ictDL5ZTbDPXsquo7tadmr6wWB7QBd7P3uDZfpuXVim1ZosxEAMYAGcs0003dlL7aa5'
STRIPE_SECRET_KEY='sk_test_51H2wUSLsDTxFz3YrBrgykuBGFvYnrua3QrjlkxiS5wMUaMpTOYbIZ4ZSjYcrr2aAo5obrAWrdiqXUkkFwafp0Vpg00DrBxdS2U'