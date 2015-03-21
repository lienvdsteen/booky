class AddUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :email
      t.string :username
      t.string :city
      t.datetime :created_on
      t.string :gender
      t.datetime :lastLogin
      t.string :status
      t.datetime :birthdate
    end
  end
end
