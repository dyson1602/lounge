require 'faker'

User.destroy_all
Post.destroy_all
Comment.destroy_all
PostComment.destroy_all

contents = ["https://www.google.com/", "https://twitter.com/home", "https://www.twitch.tv/directory", "https://www.youtube.com/"]
categories = ["Articles", "Videos"]
video_content = ["https://www.youtube.com/watch?v=5gHr8RfB0zs&list=PL4cUxeGkcC9gGrbtvASEZSlFEYBnPkmff&index=11", "https://www.youtube.com/watch?v=3GBNLCWw78o", "https://www.youtube.com/watch?v=bmVKaAV_7-A", "https://www.youtube.com/watch?v=nRe3xFeyhVY", "https://www.youtube.com/watch?v=KJWoyM1Q1tw"]
article_content = ["https://www.w3schools.com/html/html_css.asp", "https://christopher-m-clark.medium.com/rspec-isnt-given-it-s-earned-9cdb83e0d5db", "https://getbootstrap.com/docs/4.5/components/navbar/", "http://www.restular.com/", "https://ruby-doc.org/core-2.7.2/Enumerable.html", "https://rapidapi.com/marketplace"]

10.times do
    User.create(name: Faker::Name.name, user_name: Faker::Internet.username, mod: rand(1...6), bio: Faker::Movies::Ghostbusters.quote, 
    location: Faker::Nation.capital_city, password: "12345")
end

10.times do
    Post.create(user_id: User.all.sample.id, content_url: video_content.sample, category: "Videos", title: Faker::Book.title)
end

10.times do
  Post.create(user_id: User.all.sample.id, content_url: article_content.sample, category: "Articles", title: Faker::Book.title)
end

40.times do
    Comment.create(user_id: User.all.sample.id, user_comment: Faker::Games::Overwatch.quote)
end

40.times do
    PostComment.create(comment_id: Comment.all.sample.id, post_id: Post.all.sample.id)
end