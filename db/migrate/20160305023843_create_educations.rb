class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.date :start_date
      t.date :end_date
      t.string :institution
      t.string :program
      t.string :url
      t.string :image
      t.string :description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
