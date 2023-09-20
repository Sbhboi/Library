class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.integer :publication_year
      t.text :description
      t.boolean :recommended, default: false
      t.timestamps
    end
  end
end
