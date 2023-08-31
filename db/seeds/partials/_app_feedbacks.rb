app_feedback = AppFeedback.new(title: "Slow!!!",
                               contents: "This app is not nearly fast enough.
                                         Kitt sets a standard you should aspire
                                         to.")
app_feedback.profile = Profile.all.sample
app_feedback.datetime = Time.now - 20000000
app_feedback.save

app_feedback = AppFeedback.new(title: "So pretty",
                               contents: "Thank you for making a beautifull app.")
app_feedback.profile = Profile.all.sample
app_feedback.datetime = Time.now - 15000000
app_feedback.save

app_feedback = AppFeedback.new(title: "Broken link",
                               contents: "When I click on Messages in the nav
                                         it goes to my profile page.")
app_feedback.profile = Profile.all.sample
app_feedback.datetime = Time.now - 10000000
app_feedback.save
