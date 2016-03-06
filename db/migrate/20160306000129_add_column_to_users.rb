class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :description_snippet, :text
  end
end
