class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :seller
      t.string :email
      t.text :image_url

      t.timestamps
    end
  end
end
