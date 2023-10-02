User.all.each do |user|
  one = SocialLink.new(name: "LinkedIn", url: "https://www.youtube.com/watch?v=dQw4w9WgXcQ&pp=ygUXbmV2ZXIgZ29ubmEgZ2l2ZSB5b3UgdXA%3D")
  two = SocialLink.new(name: "Facebook", url: "https://www.youtube.com/watch?v=dQw4w9WgXcQ&pp=ygUXbmV2ZXIgZ29ubmEgZ2l2ZSB5b3UgdXA%3D")
  three = SocialLink.new(name: "𝕏", url: "https://www.youtube.com/watch?v=dQw4w9WgXcQ&pp=ygUXbmV2ZXIgZ29ubmEgZ2l2ZSB5b3UgdXA%3D")
  one.user = user
  two.user = user
  three.user = user
  one.save
  two.save
  three.save
end
