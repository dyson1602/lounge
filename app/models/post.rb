class Post < ApplicationRecord
    belongs_to :user
    has_many :post_comments, dependent: :destroy
    has_many :comments, through: :post_comments, dependent: :destroy


    def self.recent_posts
        self.last(10).reverse
    end

end
