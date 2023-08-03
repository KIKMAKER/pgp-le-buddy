# Add the seed actions for the development environment to this file.
puts "Development seed running."

# ---------------------- Add your seed code in this block ----------------------
# Clear existing data from database
Challenge.destroy_all

# Test user account
User.create(email: "test@test.com", password: "123456")
puts "Test user created: test@test.com, 123456"

# Kitt Challenges
load(Rails.root.join( 'db', 'seeds', 'partials', '_challenges.rb'))

# ------------------------------------------------------------------------------

puts "Development seed complete."
