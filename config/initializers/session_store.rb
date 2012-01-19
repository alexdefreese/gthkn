# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gthkn_session',
  :secret      => 'e71416692beb699185b3af36974ce9416f154080cb12152a60879402e86c8cebff9a2bda3e4d888f12791082a05cfb7b4ac91393d067c60dec8f8344e3ecf64e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
