class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|

      t.references :user, foreign_key: true, null: false
      t.references :parent, foreign_key: { to_table: :comments }
      t.text :body, limit: 250
      t.integer :like_count
      t.timestamps
    end
  end
end