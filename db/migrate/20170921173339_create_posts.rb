class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :url, null: false
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps null: false
    end
  end
end
