class AddInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :e, :string
    add_column :users, :avatar, :string
  end
end
