# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
if Rails.env.production?
  Rails.application.config.secret_token = ENV['RAILS_SECRET_TOKEN'] || raise('No secret token specified.  :(')
else
  Rails.application.config.secret_token = 'f4e042f35beb865aaf6db0c3bd539999e1cfdf6402b0bebbcdbd67fa7d4e02ea1a2ecefde033c3cd935569ec5ecc106fc451fd789ffec07a338ea810f0b85778'
end