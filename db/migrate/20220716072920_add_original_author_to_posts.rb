class AddOriginalAuthorToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :original_author, :string
  end
end
