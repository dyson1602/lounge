require 'faker'

User.destroy_all
Post.destroy_all
Comment.destroy_all
PostComment.destroy_all

contents = ["https://www.google.com/", "https://twitter.com/home", "https://www.twitch.tv/directory", "https://www.youtube.com/"]
categories = ["Articles", "Videos"]

10.times do
    User.create(name: Faker::Name.name, user_name: Faker::Internet.username, mod: rand(1...6), bio: Faker::Movies::Ghostbusters.quote, 
    location: Faker::Nation.capital_city, password: "12345")
end

30.times do
    Post.create(user_id: User.all.sample.id, content_url: contents.sample, category: categories.sample, title: Faker::Book.title)
end

40.times do
    Comment.create(user_id: User.all.sample.id, user_comment: Faker::Games::Overwatch.quote)
end

40.times do
    PostComment.create(comment_id: Comment.all.sample.id, post_id: Post.all.sample.id)
end