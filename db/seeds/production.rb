# Add the seed actions for the production environment to this file.
puts "Production seed running."

# ---------------------- Add your seed code in this block ----------------------
# Seed the Kitt Challenges
load(Rails.root.join( 'db', 'seeds', 'partials', '_challenges.rb'))

# ------------------------------------------------------------------------------

puts "Production seed complete."
