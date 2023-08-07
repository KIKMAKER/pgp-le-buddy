# Create a profile for every user
User.all.each do |user|
  profile = Profile.new
  profile.user = user
  profile.bio = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce justo enim, elementum quis aliquam vitae, dictum in nunc."*rand(3)
  profile.batch = rand(500..1400)
  profile.languages << Language.all.shuffle.take(rand(1..3)) # get all langauges shuffle the arrary take a random amount from 1 to 3 and push to profile languages
  profile.save
end
