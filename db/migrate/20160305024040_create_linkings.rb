class CreateLinkings < ActiveRecord::Migration
  def change
    create_table :linkings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :link, index: true, foreign_key: true
      t.string :url

      t.timestamps null: false
    end
  end
end
