class CreateDelivers < ActiveRecord::Migration[7.0]
  def change
    create_table :delivers do |t|
      t.string :post_number, null: false
      t.string :city, null: false
      t.string :street_line, null: false
      t.string :building, null: false
      t.string :phone_number, null: false
      t.integer :prefecture_id, null: false
      t.references :purchase, null: false, foreign_key: true 
      t.timestamps
    end
  end
end
