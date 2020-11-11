class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy

    has_secure_password

    def self.alphabetize_users
        self.all.sort_by { |user| user.name }
    end

    def total_posts
        self.posts.count
    end

end #User
