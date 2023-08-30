# Requests for BuddyUp 1 of 7
request = Request.new(message: 'Hey, Rails also did not quite click for me. Shall we try this together?')
request.buddy_up = BuddyUp.where(name: 'It did not come together in Rails.').first
request.profile = User.where(email: "joni@joni.com").first.profile
request.save
request.denied!

request = Request.new(message: 'I aced Rails so can help you with this.')
request.buddy_up = BuddyUp.where(name: 'It did not come together in Rails.').first
request.profile = User.where(email: "mitch@mitch.com").first.profile
request.save
request.approved!

request = Request.new(message: 'Can we do this one together?')
request.buddy_up = BuddyUp.where(name: 'It did not come together in Rails.').first
request.profile = User.where(email: "kira@kira.com").first.profile
request.save

# Requests for BuddyUp 2 of 7
request = Request.new(message: "Random request to join. I'll be fun, I promise.")
request.buddy_up = BuddyUp.where(name: 'Random code things!').first
request.profile = User.where(email: "shane@shane.com").first.profile
request.save

# Requests for BuddyUp 3 of 7
request = Request.new(message: 'I pick you!')
request.buddy_up = BuddyUp.where(name: 'Pick me, pick me').first
request.profile = User.where(email: "kira@kira.com").first.profile
request.save

# Requests for BuddyUp 4 of 7
  # no requests on this one to enable interactive testing of the UI

# Requests for BuddyUp 5 of 7
request = Request.new(message: 'I wanna do this, so random!')
request.buddy_up = BuddyUp.where(name: 'Catching up').first
request.profile = User.where(email: "mitch@mitch.com").first.profile
request.save

# Requests for BuddyUp 6 of 7
  # no requests on this one to enable interactive testing of the UI

# Requests for BuddyUp 7 of 7
request = Request.new(message: 'And I just want to break free!')
request.buddy_up = BuddyUp.where(name: 'I want to break things').first
request.profile = User.where(email: "shane@shane.com").first.profile
request.save
request.approved!
