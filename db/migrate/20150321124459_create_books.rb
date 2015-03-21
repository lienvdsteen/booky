class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.integer :year_published
      t.string :title, limit: 4096
      t.string :book_type
      t.string :language
      t.string :author_firstname
      t.string :author_lastname
      t.integer :beid, limit: 8

      t.timestamps null: false
    end
  end
end
