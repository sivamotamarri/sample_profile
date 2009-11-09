# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sample_profile_session',
  :secret      => '938b863c722cf37198da79027046d3a6c9a1c7abb1ac7e162259c2b1e0e18f2479fde00c477e92247634a715a1b3145fe7bf6e75af983b67655e7827f6e05226'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
