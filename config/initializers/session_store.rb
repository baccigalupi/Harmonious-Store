# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_harmonius_session',
  :secret      => '53e1342d19a3185aff464b5e1e9fde7ca8bb3f593986f272a5eeff40343749f363d52830696fce606ecfb7c7c6e0e7b0c1682e4f620ba3e1d13d1dc7bdc0ecab'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
