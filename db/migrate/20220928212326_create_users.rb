class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|

      t.string :username, null: false
      t.string :profile_picture 
      t.string :password_digest, null: false
      t.timestamps
    end
  end
end