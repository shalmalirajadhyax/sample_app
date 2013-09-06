# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
	File.read(token_file).chomp
	
	else
	token = SecureRandom.hex(64)
	File.write(token_file, token)
	token
	end
end

SampleApp::Application.config.secret_key_base = secure_token 
#'866051feb1979e0bd1dfee18a2292f7c56a20bdd301bdd5c426f9d4aba43d55c96a66bac8cbbf0cea96415d0d469e5a2b49dc9e2cf8a718f51b0fe776185e422'
