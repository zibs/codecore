class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :image
      t.string :github
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
