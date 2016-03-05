class RenameValidOnUsers < ActiveRecord::Migration
  def change
    rename_column :users, :valid, :legit

  end
end
