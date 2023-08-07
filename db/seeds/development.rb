# Add the seed actions for the development environment to this file.
puts "Development seed running."

# ---------------------- Add your seed code in this block ----------------------
# Clear existing data from database
puts "Clearing all data from the database..."
BuddyUp.destroy_all
Challenge.destroy_all
AppFeedback.destroy_all
User.destroy_all
puts "BuddyUps: #{BuddyUp.all.count}"
puts "Challenges: #{Challenge.all.count}"
puts "AppFeeback: #{AppFeedback.all.count}"
puts "Users: #{User.all.count}"
puts "...done."
puts ""

# Test user account
User.create(email: "test@test.com", password: "123456")
puts "Test user created: test@test.com, 123456"
puts ""

# Users
puts "Creating Persona users..."
User.create(email: "shane@shane.com", password: "123456", name: "Shane")
User.create(email: "joni@joni.com", password: "123456", name: "Joni")
User.create(email: "mitch@mitch.com", password: "123456", name: "Mitch")
User.create(email: "kira@kira.com", password: "123456", name: "Kira")
puts "...done. #{User.all.count - 1} users created."
puts ""

# Kitt Challenges
puts "Creating Challenges..."
load(Rails.root.join( 'db', 'seeds', 'partials', '_challenges.rb'))
puts "...done. #{Challenge.all.count} Challenges added to database."
puts ""

# AppFeedbacks
puts "Creating AppFeedbacks..."
load(Rails.root.join( 'db', 'seeds', 'partials', '_app_feedbacks.rb'))
puts "...done. #{AppFeedback.all.count} AppFeedbacks created."

# BuddyUps
puts "Creating BuddyUps..."
load(Rails.root.join( 'db', 'seeds', 'partials', '_buddy_ups.rb'))
puts "...done. #{BuddyUp.all.count} BuddyUps added to the database"
puts ""
# ------------------------------------------------------------------------------

puts "Development seed complete."
