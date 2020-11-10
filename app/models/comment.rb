class Comment < ApplicationRecord
    belongs_to :user
    has_many :post_comments, dependent: :destroy
    has_many :posts, through: :post_comments, dependent: :destroy

    
end
