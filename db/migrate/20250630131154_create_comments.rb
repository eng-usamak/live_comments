class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.references :parent, null: true, foreign_key: { to_table: :comments }
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
