class ContentsController < ApplicationController

    def mod1_articles
        @articles = Post.all.select { |post| post.category == "Articles" }
        @sorted_articles = @articles.select { |article| article.user.mod == 1}
    end

    def mod1_videos
        @videos = Post.all.select { |post| post.category == "Videos" }
        @sorted_videos = @videos.select { |video| video.user.mod == 1}
    end

    # def mod1_tips
    #     @tips = Post.all.select { |post| post.category == "Tips" }
    #     @sorted_tips = @tips.select { |tip| tip.user.mod == 1}
    # end

    def mod2_articles
        @articles = Post.all.select { |post| post.category == "Articles" }
        @sorted_articles = @articles.select { |article| article.user.mod == 2}
    end

    def mod2_videos
        @videos = Post.all.select { |post| post.category == "Videos" }
        @sorted_videos = @videos.select { |video| video.user.mod == 2}
    end

    def mod3_articles
        @articles = Post.all.select { |post| post.category == "Articles" }
        @sorted_articles = @articles.select { |article| article.user.mod == 3}
    end

    def mod3_videos
        @videos = Post.all.select { |post| post.category == "Videos" }
        @sorted_videos = @videos.select { |video| video.user.mod == 3}
    end

    def mod4_articles
        @articles = Post.all.select { |post| post.category == "Articles" }
        @sorted_articles = @articles.select { |article| article.user.mod == 4}
    end

    def mod4_videos
        @videos = Post.all.select { |post| post.category == "Videos" }
        @sorted_videos = @videos.select { |video| video.user.mod == 4}
    end

    def mod5_articles
        @articles = Post.all.select { |post| post.category == "Articles" }
        @sorted_articles = @articles.select { |article| article.user.mod == 5}
    end

    def mod5_videos
        @videos = Post.all.select { |post| post.category == "Videos" }
        @sorted_videos = @videos.select { |video| video.user.mod == 5}
    end

end