class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
	  t.string :title
      t.text :description
      t.string :url
      t.string :location
      t.integer :owner_id
      t.integer :category_id
      t.timestamps
    end
  end
end
