class AddOriginalUrlToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :original_url, :string
  end
end
