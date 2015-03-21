class LinkSwipesToBook < ActiveRecord::Migration
  def change
    add_column :user_swiped_ratings, :book_id, :integer
  end
end
