class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :content
      t.integer :book_id
      t.boolean :recommended, default: false
      t.timestamps
    end
  end
end
