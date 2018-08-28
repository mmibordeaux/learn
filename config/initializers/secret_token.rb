# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Learn::Application.config.secret_key_base = ENV['SECRET_TOKEN'] || '741d7d913923822b5703819d3437ca3b6be097f0ffb40a74f0bb32466de87a236676ea56a3cb374a0d53f1609d3da0e2ac9837c4f2d73fbf6bde0bf17c881021'
