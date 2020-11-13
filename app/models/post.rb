class Post < ApplicationRecord
    belongs_to :user
    has_many :post_comments, dependent: :destroy
    has_many :comments, through: :post_comments, dependent: :destroy


    def self.recent_posts
        self.last(12).reverse
    end

		# def youtube_embed(youtube_url)
		# 	if youtube_url[/youtu\.be\/([^\?]*)/]
		# 		youtube_id = $1
		# 	else
		# 		# Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
		# 		youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
		# 		youtube_id = $5
		# 	end
		# end

		def extract_embed(content_url)
			primed_url = content_url.sub!("watch?v=", "embed/")
			url = primed_url.split("&")[0]
		end

end #Post
