# PLEASE DO NOT SEED WITH THIS FILE.

# This file will load the appropriate seed file from the seeds/ directory based
# on the current environment (Production, Development, or Test). Add your seed
# actions to those files as appropriate.

puts "Starting database seed..."
puts "Current environment is: #{Rails.env.downcase}"
puts ""

load(Rails.root.join( 'db', 'seeds', "#{Rails.env.downcase}.rb"))
