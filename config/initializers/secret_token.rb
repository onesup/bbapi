# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# Although this is not needed for an api-only application, rails4 
# requires secret_key_base or secret_toke to be defined, otherwise an 
# error is raised.
# Using secret_token for rails3 compatibility. Change to secret_key_base
# to avoid deprecation warning.
# Can be safely removed in a rails3 api-only application.
Bbapi::Application.config.secret_token = 'dc3b33a83edf9a2c22803c3799597d36f9de28edd531b431f0cbbd26114cbf9b0711902ffd358bd2842ae60621d220abfe7a9783e2d1f464f2fef1b84ee83aac'
Bbapi::Application.config.secret_key_base = '5690e76eff7d6450bd35ffefd250ae2297470389dbf180952c23a4bbaf3ebc8d0063961da2495890a060bf4435c79afc89c0a706c99f0e84a68ab77955df1ce2'
