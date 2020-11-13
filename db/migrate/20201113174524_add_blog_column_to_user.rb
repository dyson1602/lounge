class AddBlogColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :blog, :string
  end
end
