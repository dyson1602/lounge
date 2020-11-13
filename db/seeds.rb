require 'faker'

User.destroy_all
Post.destroy_all
Comment.destroy_all
PostComment.destroy_all

blogs = [
    "https://christopher-m-clark.medium.com/",
    "https://javaughngrant.medium.com/"
    ]
categories = ["Articles", "Videos"]
video_content = [
    "https://www.youtube.com/watch?v=x2RNw4M6cME&ab_channel=ColtSteele", 
    "https://www.youtube.com/watch?v=7jGqcZ8ko2s&ab_channel=ColtSteele", 
    "https://www.youtube.com/watch?v=9U3IhLAnSxM&ab_channel=ColtSteele", 
    "https://www.youtube.com/watch?v=fi81bovqxXI&ab_channel=ColtSteele", 
    "https://www.youtube.com/watch?v=v9Hqy5Nxthc&ab_channel=ColtSteele"
    ]
article_content = [
    "https://www.w3schools.com/html/html_css.asp", 
    "https://christopher-m-clark.medium.com/rspec-isnt-given-it-s-earned-9cdb83e0d5db", 
    "https://getbootstrap.com/docs/4.5/components/navbar/", 
    "http://www.restular.com/", 
    "https://ruby-doc.org/core-2.7.2/Enumerable.html", 
    "https://rapidapi.com/marketplace"
    ]

10.times do
    User.create(name: Faker::Name.name, user_name: Faker::Internet.username, mod: rand(1...6), bio: Faker::Movies::Ghostbusters.quote, 
    location: Faker::Nation.capital_city, password: "12345", blog: blogs.sample)
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