# Auto-match false, and status active
buddy_up = BuddyUp.new(name: "It did not come together in Rails.", description: "I want to try the stupid coaching challenge in rails again since things don't quite make sense to me. Looking for someone that will have time to do this in a Slack Hustle and maybe explain some of the concepts as we go.", auto_match: false, availability: "Weekends 8am – 5pm", favourites: 8)
buddy_up.user = User.where(email: "shane@shane.com").first
buddy_up.challenge = Challenge.where(["module = ? and name = ?", "Rails", "Stupid Coaching"]).first
buddy_up.save
buddy_up.active!
buddy_up = BuddyUp.new(name: "Random code things!", description: "Just feel like trying out a random challenge so I chose this one. See ya soon!!", auto_match: false, availability: "Mondays and Wednesdays, 11:00 to 16:00", favourites: 2)
buddy_up.user = User.all.sample
buddy_up.challenge = Challenge.all.sample
buddy_up.save
buddy_up.active!
# Auto-match true and status active
buddy_up = BuddyUp.new(name: "Pick me, pick me", description: "This challenge really got me during the bootcamp so I want to give it another try.", auto_match: true, availability: "Fridays, just after midnight for an hour or two", favourites: 0)
buddy_up.user = User.all.sample
buddy_up.challenge = Challenge.all.sample
buddy_up.save
buddy_up.active!
buddy_up = BuddyUp.new(name: "For those idle evenings", description: "I have some free time in the evenings and thought I'd fill the time with some challenges. This particular one was chosen at random.", auto_match: true, availability: "Weekday evenings after 7pm until late", favourites: 1)
buddy_up.user = User.all.sample
buddy_up.challenge = Challenge.all.sample
buddy_up.save
buddy_up.active!
buddy_up = BuddyUp.new(name: "Catching up", description: "After bootcamp I had to return to my job and never really had time to code. Looking to get back into it now by doing some of the challenges again.", auto_match: true, availability: "All day Sunday.", favourites: 4)
buddy_up.user = User.all.sample
buddy_up.challenge = Challenge.all.sample
buddy_up.save
buddy_up.active!
# Auto-match true and status archived
buddy_up = BuddyUp.new(name: "Help me help myself", description: "Have been struggling with this challenge for a while but just cannot figure it out. I have forked it on Github and if you join we can just jump in since I have the basics in there already.", auto_match: true, availability: "Weekends", favourites: 94)
buddy_up.user = User.all.sample
buddy_up.challenge = Challenge.all.sample
buddy_up.save
buddy_up.archived!
# Auto-match true and status complete
buddy_up = BuddyUp.new(name: "I want to break things", description: "Thought I'd make a challenge that will auto-match but shouldn't since it is complete.", auto_match: true, availability: "Like, whenever dude.", favourites: 4831)
buddy_up.user = User.all.sample
buddy_up.challenge = Challenge.all.sample
buddy_up.save
buddy_up.complete!
