class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.string :post_id, null: false
      t.string :category_id, null: false

      t.timestamps null: false
    end

    add_index :categorizations, [:post_id, :category_id], unique: true
  end
end
