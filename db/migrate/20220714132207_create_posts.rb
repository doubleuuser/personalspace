class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :original_url
      t.string :note
      t.string :user, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
