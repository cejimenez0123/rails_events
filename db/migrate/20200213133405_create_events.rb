class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :discription
      t.integer :category_id
      t.integer :created_by_id
      t.timestamps 
    end
  end
end
