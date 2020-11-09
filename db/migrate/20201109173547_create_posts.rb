class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :content_url
      t.string :category

      t.timestamps
    end
  end
end
