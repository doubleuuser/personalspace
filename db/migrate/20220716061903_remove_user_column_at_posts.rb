class RemoveUserColumnAtPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :user, :string
    add_reference :posts, :user, foreign_key: true
  end
end
