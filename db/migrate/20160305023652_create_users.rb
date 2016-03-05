class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.boolean :admin, default: false, null: false
      t.boolean :valid, default: false, null: false
      t.boolean :hidden, default: false, null: false
      t.boolean :available, default: true, null: false
      t.text :description
      t.string :image

      t.timestamps null: false
    end
    add_index :users, :email
  end
end
