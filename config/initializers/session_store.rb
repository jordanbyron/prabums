# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_prabums_session',
  :secret      => '6f02b611e6484049c85ec567b13a869aaf577073e4f86f68f26ff75e158dd3ebbe477a6ed543d59140390f08e1557a6278cd93dbda35750b33bc863af9fb6021'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
