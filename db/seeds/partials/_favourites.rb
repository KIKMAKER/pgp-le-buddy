Profile.all.each do |profile|
  5.times do
    fav = Favourite.new(profile:)
    fav.buddy_up = BuddyUp.all.sample
    fav.save
  end
end
