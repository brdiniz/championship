# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_campeonatos_session',
  :secret      => '53881303334bf38a55481de8926bc44585254249c2b492ca3e3a9773a76e955e5a2708364ba16e7800052997a307651f79b78061a919ad8d4e4b6062ab3168a0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
