# Add the seed actions for the development environment to this file.
puts "Development seed running."

# ---------------------- Add your seed code in this block ----------------------
# Clear existing data from database
Challenge.destroy_all

# Seed the Kitt Challenges
load(Rails.root.join( 'db', 'seeds', 'partials', '_challenges.rb'))

# ------------------------------------------------------------------------------

puts "Development seed complete."
