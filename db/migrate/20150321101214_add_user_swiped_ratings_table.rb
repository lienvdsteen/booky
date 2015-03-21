class AddUserSwipedRatingsTable < ActiveRecord::Migration
  def change
    create_table :user_swiped_ratings do |t|
      t.integer :user_id
      t.string :isbn
      t.boolean :rating
    end
  end
end
