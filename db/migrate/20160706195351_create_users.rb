class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.datetime :bday
      t.string :email

      t.timestamps null: false
    end
  end
end
