require 'faker'

User.destroy_all
Post.destroy_all
Comment.destroy_all
PostComment.destroy_all

contents = ["https://www.google.com/", "https://twitter.com/home", "https://www.twitch.tv/directory", "https://www.youtube.com/"]
categories = ["Articles", "Videos", "Tips", "Chairs", "Profiles"]

5.times do
    User.create(name: Faker::Name.name, mod: rand(1...5), bio: Faker::Movies::Ghostbusters.quote, 
    location: Faker::Nation.capital_city)
end

10.times do
    Post.create(user_id: User.all.sample.id, content_url: contents.sample, category: categories.sample)
end

15.times do
    Comment.create(user_id: User.all.sample.id, user_comment: Faker::Games::Overwatch.quote)
end

15.times do
    PostComment.create(comment_id: Comment.all.sample.id, post_id: Post.all.sample.id)
end